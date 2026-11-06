import 'package:flutter/material.dart';
import 'package:weather_with_flutter/services/open_weather_service/types/forecast_types.dart';

import '../../app/themes.dart';
import '../../l10n/l10n_context.dart';
import '../../services/location/types/location.dart';
import '../../services/open_weather_service/types/event.dart';
import '../../services/open_weather_service/types/weather_item.dart';
import '../../tools/location_time.dart';
import '../formatters/weathers_labels.dart';
import 'weather_emoji.dart';

class const WeatherNow({
  super.key,
  required final DaysForecast _forecast,
  required final Location? _location,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todayForecast = _forecast.first;
    final currentWeather = _getCurrentWeather(todayForecast);
    final min = todayForecast.minTemperature.temperature;
    final max = todayForecast.maxTemperature.temperature;
    final weatherType = currentWeather != null ? WeatherLabels.name(context.l10n, currentWeather.item.type) : null;
    final temperature = currentWeather != null ? currentWeather.item.temperature.temperature.toString() : '';
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          if (_location != null)
            Text(
              _location.name,
              style: AppTextStyles.textExtraLarge.copyWith(fontWeight: .bold),
              textAlign: .center,
            ),
          if (currentWeather != null) WeatherEmoji(type: currentWeather.item.type, date: currentWeather.start, size: 80),
          if (currentWeather != null)
            Text(
              weatherType ?? currentWeather.item.type.name,
              style: AppTextStyles.textLarge.copyWith(fontSize: 30, fontWeight: .bold),
            ),
          if (currentWeather != null)
            Row(
              mainAxisAlignment: .center,
              children: [
                Text(
                  '$temperature°',
                  style: AppTextStyles.textExtraLarge.copyWith(fontSize: 40, fontWeight: .bold),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      'min: $min°',
                      style: AppTextStyles.textSmall.copyWith(fontWeight: .bold),
                    ),
                    Text(
                      'max: $max°',
                      style: AppTextStyles.textSmall.copyWith(fontWeight: .bold),
                    ),
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }

  Event<WeatherItem>? _getCurrentWeather(DayForecast day) {
    if (day.hoursForecast.isEmpty) return null;
    final currentHour = locationNow(_location?.utcOffsetSeconds).hour;
    var item = day.hoursForecast.first;
    for (var i = 1; i < day.hoursForecast.length; i++) {
      final hour = day.hoursForecast[i];
      if (hour.start.hour > currentHour) {
        item = day.hoursForecast[i - 1];
        break;
      }
    }
    return item;
  }
}
