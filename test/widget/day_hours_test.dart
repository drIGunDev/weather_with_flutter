import 'package:flutter_test/flutter_test.dart';
import 'package:weather_with_flutter/presentation/widgets/day_hours.dart';
import 'package:weather_with_flutter/presentation/widgets/hour_column.dart';
import 'package:weather_with_flutter/tools/location_time.dart';

import 'support/widget_helpers.dart';

void main() {
  testWidgets('hides hours that have already passed at the location', (tester) async {
    for (final offset in [11 * 3600, -8 * 3600]) {
      final now = locationNow(offset);
      // DayHours keeps the hour that started at most 60 minutes ago.
      final firstShown = now.minute == 0 ? now.hour - 1 : now.hour;

      await pumpApp(tester, DayHours(day: dayOf(DateTime(now.year, now.month, now.day)), utcOffsetSeconds: offset));

      expect(find.byType(HourColumn), findsNWidgets(24 - firstShown.clamp(0, 23)), reason: 'offset $offset s');
      expect(find.text('23:00'), findsOneWidget);
    }
  });

  testWidgets('shows the table header', (tester) async {
    final now = locationNow(0);
    await pumpApp(tester, DayHours(day: dayOf(DateTime(now.year, now.month, now.day)), utcOffsetSeconds: 0));

    for (final title in ['Time', 'Weather', 'Temp.', 'Wind']) {
      expect(find.text(title), findsOneWidget);
    }
  });
}
