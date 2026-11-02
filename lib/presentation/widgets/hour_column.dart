import 'package:flutter/material.dart';
import 'package:weather_with_flutter/app/themes.dart';

import '../../services/open_weather_service/types/event.dart';
import '../../services/open_weather_service/types/weather_item.dart';
import '../formatters/date_time_format.dart';
import 'weather_emoji.dart';

class const HourColumn({super.key, required final Event<WeatherItem> event}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final item = event.item;
    final textStyle = AppTextStyles.textSmall.copyWith(fontWeight: .bold);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: .spaceAround,
        children: [
          Text(DateTimeFormat.time(event.start), style: textStyle),
          Column(
            children: [
              WeatherEmoji(type: event.item.type, date: event.start, size: 30),
            ],
          ),
          Text('${item.precipitation.probabilityPercent}%', style: textStyle),
          Text('${item.temperature.temperature}°', style: textStyle.copyWith(fontSize: 14)),
        ],
      ),
    );
  }
}
