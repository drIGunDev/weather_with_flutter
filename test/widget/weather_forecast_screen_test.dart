import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_with_flutter/l10n/app_localizations.dart';
import 'package:weather_with_flutter/presentation/screens/weather_forecast.dart';
import 'package:weather_with_flutter/presentation/widgets/day_compose.dart';
import 'package:weather_with_flutter/presentation/widgets/hour_column.dart';
import 'package:weather_with_flutter/services/location/state/last_update_counter.dart';
import 'package:weather_with_flutter/services/open_weather_service/state/forecast_notifier.dart';
import 'package:weather_with_flutter/services/open_weather_service/weather_service.dart';

import 'support/widget_helpers.dart';

/// A stand-in for [ForecastNotifier] that reports whatever state the test wants,
/// without touching the network or the database.
class _FakeForecastNotifier extends ForecastNotifier {
  _FakeForecastNotifier(this._build);

  final FutureOr<WeatherForecastState> Function() _build;

  @override
  FutureOr<WeatherForecastState> build() => _build();
}

Future<void> pumpScreen(WidgetTester tester, FutureOr<WeatherForecastState> Function() state) {
  return tester.pumpWidget(
    ProviderScope(
      // Riverpod 3 retries a failing provider with back-off, which would keep the screen in
      // `loading` instead of showing the error we want to check.
      retry: (_, _) => null,
      overrides: [
        weatherForecastProvider.overrideWith(() => _FakeForecastNotifier(state)),
        forecastLastUpdateCounter.overrideWith((ref, location) => Stream.value(30)),
      ],
      child: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const WeatherForecast(),
      ),
    ),
  );
}

void main() {
  testWidgets('loading: shows a progress indicator', (tester) async {
    final never = Completer<WeatherForecastState>();
    await pumpScreen(tester, () => never.future);

    expect(find.text('loading ...'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('empty: asks the user to select a location', (tester) async {
    await pumpScreen(tester, () => WeatherForecastState.empty);
    await tester.pump();

    expect(find.text('No forecast, select the location'), findsOneWidget);
  });

  testWidgets('error: shows the error text', (tester) async {
    await pumpScreen(tester, () => throw CommunicationError('offline'));
    await tester.pump();

    expect(find.textContaining('CommunicationError: offline'), findsOneWidget);
  });

  testWidgets('data: shows the location and one card per day; tapping a card reveals its hours', (tester) async {
    // ListView builds its children lazily; a tall screen makes both day cards visible.
    tester.view.physicalSize = const Size(800, 4000);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    final today = DateTime.now();
    final days = [dayOf(today), dayOf(today.add(const Duration(days: 1)))];
    await pumpScreen(tester, () => WeatherForecastState(forecast: days, location: sydney));
    await tester.pump();

    expect(find.text('Sydney'), findsOneWidget);
    expect(find.byType(DayCompose), findsNWidgets(2));
    expect(find.byType(HourColumn), findsNothing, reason: 'cards start collapsed');

    await tester.tap(find.byType(DayCompose).first);
    await tester.pump();

    expect(find.byType(HourColumn), findsWidgets);
  });
}
