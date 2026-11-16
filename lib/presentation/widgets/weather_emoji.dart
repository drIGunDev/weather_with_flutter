import 'package:material_ui/material_ui.dart';

import '../../services/open_weather_service/types/weather_type.dart';
import '../formatters/weathers_labels.dart';

class const WeatherEmoji({
  super.key,
  required final WeatherType _type,
  required final DateTime? _date,
  final double _size = 20,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final emoji = _date == null ? WeatherLabels.emoji(_type) : WeatherLabels.emojiForHour(_type, _date.hour);
    return Text(emoji, style: TextStyle(fontSize: _size));
  }
}
