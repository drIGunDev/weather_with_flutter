import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../app/app_config.dart';
import '../../tools/logger/log.dart';
import 'types/event.dart';
import 'types/forecast_types.dart';
import 'types/precipitation.dart';
import 'types/temperature.dart';
import 'types/weather_item.dart';
import 'types/weather_type.dart';
import 'types/wind.dart';
import 'weather_service.dart';

typedef WeatherApiRequestObserver = void Function(Uri uri, {int? statusCode});

final class const OpenMeteoWeatherServiceImpl({required this._client, this._onRequest}) implements WeatherService {
  static const String _hourly =
      'rain,temperature_2m,apparent_temperature,precipitation_probability,'
      'precipitation,weather_code,wind_speed_10m,wind_direction_10m,'
      'wind_gusts_10m';

  final http.Client _client;
  final WeatherApiRequestObserver? _onRequest;

  @override
  Future<ForecastList> fetchForecast({required WeatherForecastFetchParameters params}) async {
    final uri = Uri.https('api.open-meteo.com', '/v1/forecast', {
      'latitude': params.location.latitude.toString(),
      'longitude': params.location.longitude.toString(),
      'hourly': _hourly,
      'wind_speed_unit': 'kmh',
      'timezone': 'auto',
      'past_days': '${params.pastDays}',
      'forecast_days': '${params.forecastDays}',
    });
    Log.d('request: $uri');
    final response = await _send(uri);
    return switch (response.statusCode) {
      200 => _transformToEvents(response.body, params.location),
      _ => throw CommunicationError('HTTP ${response.statusCode}'),
    };
  }

  Future<http.Response> _send(Uri uri) async {
    int? statusCode;
    try {
      final response = await _client.get(uri).timeout(Duration(seconds: AppParams.requestTimeoutSec));
      statusCode = response.statusCode;
      return response;
    } on SocketException catch (e) {
      throw CommunicationError(e.toString());
    } on http.ClientException catch (e) {
      throw CommunicationError(e.toString());
    } on TimeoutException catch (e) {
      throw CommunicationError(e.toString());
    } finally {
      _onRequest?.call(uri, statusCode: statusCode);
    }
  }

  Future<List<Event<WeatherItem>>> _transformToEvents(
    String responseBody,
    location,
  ) async {
    final (decoded, utcOffsetSeconds) = await _parseResponse(responseBody);
    // Hourly timestamps are wall-clock time at the location; remember how far that is from UTC.
    final located = location.copyWith(utcOffsetSeconds: utcOffsetSeconds);

    final results = <Event<WeatherItem>>[];
    for (var i = 0; i < decoded.time.length; i++) {
      final start = decoded.time[i];
      final end = start.add(const Duration(hours: 1));
      final precipitation = Precipitation(
        probabilityPercent: decoded.precipitationProbability[i].toDouble(),
        amountMm: decoded.precipitation[i],
        rain: decoded.rain[i],
      );
      final wind = Wind(
        forceKmPerHour: decoded.windSpeed[i],
        gustsKmPerHour: decoded.windGusts[i],
        directionGrad: decoded.windDirection[i].toDouble(),
      );
      final weatherItem = WeatherItem(
        type: WeatherType.fromCode(decoded.weatherCode[i]),
        temperature: Temperature.fromCelsius(decoded.temperature[i]),
        apparentTemperature: Temperature.fromCelsius(
          decoded.apparentTemperature[i],
        ),
        precipitation: precipitation,
        wind: wind,
        location: located,
      );
      final event = Event(start: start, end: end, item: weatherItem);
      results.add(event);
    }
    return results;
  }

  Future<(_OpenMeteoHourlyDTO, int?)> _parseResponse(String responseBody) async {
    final decoded = jsonDecode(responseBody);
    if (decoded is! Map<String, dynamic>) {
      throw const FormatException('Expected JSON object');
    }
    final json = decoded;
    final hourly = json['hourly'];

    return (_OpenMeteoHourlyDTO.fromJson(hourly), (json['utc_offset_seconds'] as num?)?.toInt());
  }
}

final class const _OpenMeteoHourlyDTO({
  required this.time,
  required this.temperature,
  required this.rain,
  required this.windSpeed,
  required this.windGusts,
  required this.windDirection,
  required this.apparentTemperature,
  required this.precipitationProbability,
  required this.precipitation,
  required this.weatherCode,
}) {
  final List<DateTime> time;
  final List<double> temperature;
  final List<double> apparentTemperature;
  final List<double> rain;
  final List<double> windSpeed;
  final List<double> windGusts;
  final List<int> windDirection;
  final List<int> precipitationProbability;
  final List<double> precipitation;
  final List<int> weatherCode;

  factory _OpenMeteoHourlyDTO.fromJson(Map<String, dynamic> json) {
    return _OpenMeteoHourlyDTO(
      time: _stringList(
        json,
        'time',
      ).map(DateTime.parse).toList(growable: false),
      temperature: _doubleList(json, 'temperature_2m'),
      rain: _doubleList(json, 'rain'),
      windSpeed: _doubleList(json, 'wind_speed_10m'),
      windGusts: _doubleList(json, 'wind_gusts_10m'),
      windDirection: _intList(json, 'wind_direction_10m'),
      apparentTemperature: _doubleList(json, 'apparent_temperature'),
      precipitationProbability: _intList(json, 'precipitation_probability'),
      precipitation: _doubleList(json, 'precipitation'),
      weatherCode: _intList(json, 'weather_code'),
    );
  }

  static List<String> _stringList(
    Map<String, dynamic> json,
    String key,
  ) {
    final value = json[key];
    if (value is! List) {
      throw FormatException('Missing or invalid "$key"');
    }
    return value
        .map((item) {
          switch (item) {
            case null:
              return '';
            case String _:
              return item.toString();
            default:
              throw FormatException(
                'Invalid item in "$key": expected number, got ${item.runtimeType}',
              );
          }
        })
        .toList(growable: false);
  }

  static List<double> _doubleList(
    Map<String, dynamic> json,
    String key,
  ) {
    final value = json[key];
    if (value is! List) {
      throw FormatException('Missing or invalid "$key"');
    }
    return value
        .map((item) {
          switch (item) {
            case null:
              return 0.0;
            case num _:
              return item.toDouble();
            default:
              throw FormatException(
                'Invalid item in "$key": expected number, got ${item.runtimeType}',
              );
          }
        })
        .toList(growable: false);
  }

  static List<int> _intList(
    Map<String, dynamic> json,
    String key,
  ) {
    final value = json[key];
    if (value is! List) {
      throw FormatException('Missing or invalid "$key"');
    }
    return value
        .map((item) {
          switch (item) {
            case null:
              return 0;
            case num _:
              return item.toInt();
            default:
              throw FormatException(
                'Invalid item in "$key": expected number, got ${item.runtimeType}',
              );
          }
        })
        .toList(growable: false);
  }
}
