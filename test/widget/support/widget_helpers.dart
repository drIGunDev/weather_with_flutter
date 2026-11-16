import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart' show Override;
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_with_flutter/l10n/app_localizations.dart';
import 'package:weather_with_flutter/services/location/types/location.dart';
import 'package:weather_with_flutter/services/open_weather_service/types/event.dart';
import 'package:weather_with_flutter/services/open_weather_service/types/forecast_types.dart';
import 'package:weather_with_flutter/services/open_weather_service/types/precipitation.dart';
import 'package:weather_with_flutter/services/open_weather_service/types/temperature.dart';
import 'package:weather_with_flutter/services/open_weather_service/types/weather_item.dart';
import 'package:weather_with_flutter/services/open_weather_service/types/weather_type.dart';
import 'package:weather_with_flutter/services/open_weather_service/types/wind.dart';

final sydney = Location(
  id: 'sydney',
  name: 'Sydney',
  latitude: -33.87,
  longitude: 151.21,
  country: 'Australia',
  countryCode: 'AU',
  city: 'New South Wales',
  timezone: 'Australia/Sydney',
  utcOffsetSeconds: 11 * 3600,
);

/// Hosts [child] in the minimum an app screen needs: Riverpod, localizations, a Material ancestor.
///
/// Every widget test starts here. `overrides` replace real providers (database, network, ...)
/// with fakes, which is what keeps UI tests fast and deterministic.
Future<void> pumpApp(
  WidgetTester tester,
  Widget child, {
  List<Override> overrides = const [],
}) {
  return tester.pumpWidget(
    ProviderScope(
      overrides: overrides,
      child: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(body: SingleChildScrollView(child: child)),
      ),
    ),
  );
}

/// A full day of 24 hourly events on [day]; the temperature of hour `h` is `h + 0.5`,
/// so a test can tell which hour a widget picked by reading the temperature.
DayForecast dayOf(DateTime day, {Location? location}) {
  return DayForecast(
    hoursForecast: [
      for (var h = 0; h < 24; h++)
        Event<WeatherItem>(
          start: DateTime(day.year, day.month, day.day, h),
          end: DateTime(day.year, day.month, day.day, h + 1),
          item: WeatherItem(
            type: WeatherType.fromCode(3),
            temperature: Temperature.fromCelsius(h + 0.5),
            apparentTemperature: Temperature.fromCelsius(h.toDouble()),
            precipitation: const Precipitation(probabilityPercent: 0, amountMm: 0, rain: 0),
            wind: const Wind(forceKmPerHour: 10, gustsKmPerHour: 15, directionGrad: 90),
            location: location ?? sydney,
          ),
        ),
    ],
  );
}
