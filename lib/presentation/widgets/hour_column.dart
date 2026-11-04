import 'package:flutter/material.dart';
import 'package:weather_with_flutter/app/themes.dart';
import 'package:weather_with_flutter/presentation/widgets/precipitation_level.dart';

import '../../services/open_weather_service/types/event.dart';
import '../../services/open_weather_service/types/weather_item.dart';
import '../formatters/date_time_format.dart';
import 'day_summary.dart';
import 'weather_emoji.dart';

class const HourColumn({
  super.key,
  required final Event<WeatherItem> event,
  final WeatherLayout temperatureLayout = .temperature,
}) extends StatelessWidget {
  static const _precipitationIndicatorSegments = 5;

  @override
  Widget build(BuildContext context) {
    final item = event.item;
    final textStyle = AppTextStyles.textSmall.copyWith(fontWeight: .bold);
    final precipitationLive = (item.precipitation.probabilityPercent / 100 * _precipitationIndicatorSegments).toInt();
    return Padding(
      padding: const .only(top: 8, bottom: 8, right: 4, left: 4),
      child: Column(
        mainAxisAlignment: .spaceAround,
        children: [
          Text(DateTimeFormat.time(event.start), style: textStyle),
          ...switch (temperatureLayout) {
            WeatherLayout.temperature => [
              WeatherEmoji(type: event.item.type, date: event.start, size: 30),
              Text('${item.temperature.temperature}°', style: textStyle.copyWith(fontSize: 14)),
            ],
            WeatherLayout.precipitation => [
              const SizedBox(height: 5),
              SizedBox(
                width: 28,
                height: 40,
                child: PrecipitationLevel(
                  level: precipitationLive,
                  segments: _precipitationIndicatorSegments,
                  segmentColor: Colors.cyan,
                  backgroundColor: Colors.grey,
                ),
              ),
              const SizedBox(height: 5),
              Text('${item.precipitation.probabilityPercent}%', style: textStyle),
            ],
          },
        ],
      ),
    );
  }
}
