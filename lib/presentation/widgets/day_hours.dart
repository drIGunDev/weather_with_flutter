import 'package:flutter/material.dart';

import '../../services/open_weather_service/types/forecast_types.dart';
import '../../tools/location_time.dart';
import 'hour_column.dart';

class const DayHours({
  super.key,
  required final DayForecast day,
  required final int? utcOffsetSeconds,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final now = locationNow(utcOffsetSeconds);
    return SingleChildScrollView(
      scrollDirection: .horizontal,
      child: Row(
        children: [
          for (var i = 0; i < day.hoursForecast.length; i++) ...[
            if (day.hoursForecast[i].start.millisecondsSinceEpoch >= now.millisecondsSinceEpoch - 3600000) ...[
              HourColumn(event: day.hoursForecast[i]),
            ],
          ],
        ],
      ),
    );
  }
}
