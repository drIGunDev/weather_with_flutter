import 'package:flutter/material.dart';
import 'package:weather_with_flutter/app/themes.dart';

import '../../l10n/l10n_context.dart';
import '../../services/open_weather_service/types/event.dart';
import '../../services/open_weather_service/types/forecast_types.dart';
import '../../services/open_weather_service/types/weather_item.dart';
import '../formatters/date_time_format.dart';
import '../formatters/weathers_labels.dart';
import 'hour_column.dart';
import 'weather_emoji.dart';

class const DaySummary({
  super.key,
  required final DayForecast day,
  final bool isExpanded = false,
  final WeatherLayout weatherLayout = .temperature,
  final Function(WeatherLayout)? onLayoutChanged,
}) extends StatefulWidget {
  @override
  State<DaySummary> createState() => _DaySummaryState();
}

class _DaySummaryState extends State<DaySummary> {
  WeatherLayout _layout = .temperature;

  @override
  void initState() {
    super.initState();
    _layout = widget.weatherLayout;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            children: [
              Text(
                DateTimeFormat.dayShort(context.l10n, widget.day.hoursForecast.first.start),
                style: AppTextStyles.textLarge.copyWith(fontWeight: .bold, color: AppColors.bgScaffold),
              ),

              const SizedBox(width: 10),

              _statTemp(),
            ],
          ),

          const SizedBox(height: 5),

          Row(
            children: [
              if (widget.isExpanded)
                RadioGroup<WeatherLayout>(
                  groupValue: _layout,
                  onChanged: (value) => setState(() {
                    _layout = value!;
                    widget.onLayoutChanged?.call(value);
                  }),
                  child: Row(
                    children: [
                      Text('🌡'),
                      Radio<WeatherLayout>(
                        value: .temperature,
                        activeColor: Colors.white,
                      ),
                      Text('🌧️'),
                      Radio<WeatherLayout>(
                        value: .precipitation,
                        activeColor: Colors.white,
                      ),
                    ],
                  ),
                ),
            ],
          ),

          const SizedBox(height: 5),

          Padding(
            padding: .only(top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: .spaceEvenly,
              children: [
                if (widget.day.superior.start.millisecondsSinceEpoch < widget.day.inferior.start.millisecondsSinceEpoch) ...[
                  _supremeWeather('superior', widget.day.superior),

                  const SizedBox(height: 20),

                  _supremeWeather('inferior', widget.day.inferior),
                ] else ...[
                  _supremeWeather('inferior', widget.day.inferior),

                  const SizedBox(height: 20),

                  _supremeWeather('superior', widget.day.superior),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _supremeWeather(String title, Event<WeatherItem> event) {
    final item = event.item;
    final textStyle = AppTextStyles.textMedium.copyWith(fontWeight: .bold);
    return Builder(
      builder: (context) {
        final supremeWeatherType = WeatherLabels.name(context.l10n, item.type);
        return Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            Row(
              children: [
                Text(title, style: textStyle),
                const SizedBox(width: 5),

                Text(DateTimeFormat.time(event.start), style: textStyle),
              ],
            ),

            Row(
              children: [
                const SizedBox(width: 5),

                Text('${item.temperature.temperature}°', style: textStyle.copyWith(fontSize: 18)),

                const SizedBox(width: 5),

                Column(
                  mainAxisAlignment: .start,
                  children: [
                    WeatherEmoji(type: item.type, date: event.start, size: 30),
                    if (item.precipitation.probabilityPercent > 0) Text('${item.precipitation.probabilityPercent} %', style: textStyle),
                    Text(supremeWeatherType, style: textStyle),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _statTemp() {
    final minTemperature = widget.day.minTemperature;
    final maxTemperature = widget.day.maxTemperature;
    final textStyle = AppTextStyles.textLarge.copyWith(fontWeight: .bold);
    return Text(
      '🌡️ ${minTemperature.temperature} - ${maxTemperature.temperature}°C',
      style: textStyle,
    );
  }
}
