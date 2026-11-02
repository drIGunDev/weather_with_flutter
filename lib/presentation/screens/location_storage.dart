import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weather_with_flutter/presentation/widgets/location_row.dart';

import '../../app/main.dart';
import '../../app/themes.dart';
import '../../services/location/state/location_storage_notifier.dart';
import '../../services/open_weather_service/state/forecast_notifier.dart';
import '../../services/open_weather_service/weather_service.dart';

class const LocationStorage({super.key}) extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locations = ref.watch(locationStorageProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Locations",
          style: AppTextStyles.scaffoldBarHeader.copyWith(color: Colors.black),
        ),
        backgroundColor: AppColors.bgScaffold,
      ),
      backgroundColor: AppColors.bgSurface,
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 16, bottom: 8),
        child: Column(
          children: [
            Expanded(
              child: locations.when(
                data: (data) {
                  return ListView(
                    children: data.locations.map((location) {
                      return LocationRow(
                        location: location,
                        onTap: () async {
                          Navigator.pushReplacementNamed(context, NavigationPaths.root);

                          await ref.read(locationStorageProvider.notifier).setLocationActive(location: location);
                          await ref.read(weatherForecastProvider.notifier).fetchForecast(params: WeatherForecastFetchParameters(location: location));
                        },
                        onDelete: () async {
                          await ref.read(locationStorageProvider.notifier).remove(location: location);
                          final results = await ref.read(locationStorageProvider.future);
                          if (results.locations.isEmpty) {
                            await ref.read(weatherForecastProvider.notifier).delete(location: location);
                            return;
                          }
                          final activeLocation = results.activeLocation;
                          if (activeLocation != null) {
                            await ref
                                .read(weatherForecastProvider.notifier)
                                .fetchForecast(params: WeatherForecastFetchParameters(location: activeLocation));
                          }
                        },
                      );
                    }).toList(),
                  );
                },
                loading: () => const CircularProgressIndicator(),
                error: (err, stack) => Text('Error: $err'),
              ),
            ),

            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, NavigationPaths.locationSelection),
              child: const Text('Add location'),
            ),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(AppSpacing.large),
                  onTap: () async => launchUrl(Uri.parse('https://open-meteo.com/')),
                  child: Text(
                    'Forecasts by Open-Meteo.com (c) licensed under CC BY 4.0',
                    style: TextStyle(color: Colors.blue),
                    textAlign: .center,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
