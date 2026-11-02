import 'event.dart';
import 'temperature.dart';
import 'weather_item.dart';

typedef ForecastList = List<Event<WeatherItem>>;

final class DayForecast({
  required final ForecastList hoursForecast,
});

typedef DaysForecast = List<DayForecast>;

extension LimitedList on List<Event<WeatherItem>> {
  List<Event<WeatherItem>> range(int start, int end) => where((e) => e.start.hour > start && e.start.hour < end).toList(growable: false);
}

extension Infarior on DayForecast {
  static const int timeStart = 6;
  static const int timeEnd = 17;

  Event<WeatherItem> get inferior => hoursForecast
      .range(Infarior.timeStart, Infarior.timeEnd)
      .reduce((value, element) => value.item.type.type > element.item.type.type ? value : element);

  Event<WeatherItem> get superior => hoursForecast
      .range(Infarior.timeStart, Infarior.timeEnd)
      .reduce((value, element) => value.item.type.type < element.item.type.type ? value : element);

  Temperature get minTemperature =>
      hoursForecast.reduce((value, element) => value.item.temperature.celsius < element.item.temperature.celsius ? value : element).item.temperature;

  Temperature get maxTemperature =>
      hoursForecast.reduce((value, element) => value.item.temperature.celsius > element.item.temperature.celsius ? value : element).item.temperature;

  double get minWind => hoursForecast
      .reduce((value, element) => value.item.wind.forceKmPerHour < element.item.wind.forceKmPerHour ? value : element)
      .item
      .wind
      .forceKmPerHour;

  double get maxWind => hoursForecast
      .reduce((value, element) => value.item.wind.forceKmPerHour > element.item.wind.forceKmPerHour ? value : element)
      .item
      .wind
      .forceKmPerHour;

  double get minGusts => hoursForecast
      .reduce((value, element) => value.item.wind.gustsKmPerHour < element.item.wind.gustsKmPerHour ? value : element)
      .item
      .wind
      .gustsKmPerHour;

  double get maxGusts => hoursForecast
      .reduce((value, element) => value.item.wind.gustsKmPerHour > element.item.wind.gustsKmPerHour ? value : element)
      .item
      .wind
      .gustsKmPerHour;
}

extension ToDaysForecast on ForecastList {
  DaysForecast toDaysForecast() {
    if (isEmpty) {
      return [];
    }

    final result = DaysForecast.empty(growable: true);
    var hours = ForecastList.empty(growable: true);
    DateTime? yesterday;

    for (var i = 0; i < length; i++) {
      final event = this[i];
      final day = event.start.day;
      if (yesterday == null) {
        yesterday = event.start;
        hours.add(event);
      } else if (yesterday.day == day) {
        hours.add(event);
      } else {
        result.add(DayForecast(hoursForecast: hours));
        hours = ForecastList.empty(growable: true);
        yesterday = event.start;
        hours.add(event);
      }
      if (i == length - 1) {
        if (hours.isNotEmpty) result.add(DayForecast(hoursForecast: hours.toList()));
      }
    }
    return result;
  }
}
