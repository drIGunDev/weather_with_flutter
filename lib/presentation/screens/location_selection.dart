import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/di.dart';
import '../../app/main.dart';
import '../../app/themes.dart';
import '../../services/location/geocoding_service.dart';
import '../../services/location/state/location_storage_notifier.dart';
import '../../services/open_weather_service/state/forecast_notifier.dart';
import '../../services/open_weather_service/weather_service.dart';
import '../../tools/wrapped.dart';
import '../widgets/location_row.dart';

class const LocationSelection({super.key}) extends ConsumerStatefulWidget {
  @override
  ConsumerState<LocationSelection> createState() => _GeocodingState();
}

class _GeocodingState extends ConsumerState<LocationSelection> {
  final TextEditingController _query = TextEditingController();
  var _isSearchEnable = false;

  @override
  void dispose() {
    _query.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = AppTextStyles.textMedium;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Set location',
          style: AppTextStyles.scaffoldBarHeader.copyWith(color: Colors.black),
        ),
        backgroundColor: AppColors.bgScaffold,
      ),
      backgroundColor: AppColors.bgSurface,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.large),
          children: [
            Text('Search city or place', style: textStyle),

            const SizedBox(height: 10),

            TextField(
              controller: _query,
              style: AppTextStyles.textLarge,
              decoration: InputDecoration(
                hintText: 'City',
                hintStyle: AppTextStyles.textLarge.copyWith(color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1, style: .solid),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1, style: .solid),
                ),
              ),
              autofocus: true,
              cursorColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _isSearchEnable = value.length > 2;
                });
              },
              onSubmitted: (value) async => _search(value),
            ),

            const SizedBox(height: 25),

            ElevatedButton(
              style: _isSearchEnable ? ButtonStyle() : ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.grey)),
              onPressed: () async => _search(_query.text),
              child: Text('Search'),
            ),

            const SizedBox(height: 50),

            Builder(
              builder: (context) {
                final locations = ref.watch(geocodingProvider);
                return locations.when(
                  data: (data) {
                    return Column(
                      crossAxisAlignment: .start,
                      children: [
                        if (data.result.isNotEmpty)
                          Text('Select a location'.toUpperCase(), style: AppTextStyles.textMedium.copyWith(letterSpacing: 0.5)),

                        const SizedBox(height: 16),

                        for (final location in data.result) ...[
                          LocationRow(
                            location: location,
                            onTap: () async {
                              Navigator.pushReplacementNamed(context, NavigationPaths.root);
                              final selectedLocation = location.copyWith(weatherUpdatedAt: Wrapped.value(DateTime.now()), isActive: true);
                              ref.read(locationStorageProvider.notifier).addate(location: selectedLocation);
                              ref.read(geocodingProvider.notifier).reset();
                              await ref
                                  .read(weatherForecastProvider.notifier)
                                  .fetchForecast(params: WeatherForecastFetchParameters(location: selectedLocation));
                            },
                          ),
                        ],
                      ],
                    );
                  },
                  loading: () => Center(child: const CircularProgressIndicator(color: Colors.white)),
                  error: (err, stack) => Text('Error: $err', style: AppTextStyles.textSmall),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _search(String query) async {
    await ref.read(geocodingProvider.notifier).fetchLocations(params: GeocodingFetchParameters(name: query, count: 20));
  }
}
