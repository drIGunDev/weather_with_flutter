import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_with_flutter/presentation/screens/location_storage.dart';

import '../l10n/app_localizations.dart';
import '../presentation/screens/location_selection.dart';
import '../presentation/screens/weather_forecast.dart';
import '../services/open_weather_service/state/forecast_notifier.dart';
import '../services/open_weather_service/weather_service.dart';
import 'di.dart';

abstract interface class NavigationPaths {
  static const String root = '/';
  static const String locationStorage = '/location_storage';
  static const String locationSelection = '/location_selection';
}

void main() => runApp(
  ProviderScope(
    child: _Initializer(
      child: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        initialRoute: NavigationPaths.root,
        routes: {
          NavigationPaths.root: (context) => WeatherForecast(),
          NavigationPaths.locationStorage: (context) => LocationStorage(),
          NavigationPaths.locationSelection: (context) => LocationSelection(),
        },
      ),
    ),
  ),
);

class const _Initializer({required final Widget child}) extends ConsumerStatefulWidget {
  @override
  ConsumerState<_Initializer> createState() => _InitializerState();
}

class _InitializerState extends ConsumerState<_Initializer> {
  @override
  void initState() {
    super.initState();
    unawaited(_initializing(ref));
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  Future<void> _initializing(WidgetRef ref) async {
    final locationManager = ref.read(locationManagerComponent);
    final activeLocation = await locationManager.findActiveLocation();
    if (activeLocation != null) {
      final forecastProvider = ref.read(weatherForecastProvider.notifier);
      await forecastProvider.fetchForecast(params: WeatherForecastFetchParameters(location: activeLocation));
    }
  }
}
