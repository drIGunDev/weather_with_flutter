import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_with_flutter/presentation/screens/location_storage.dart';

import '../../app/themes.dart';
import '../../services/open_weather_service/state/forecast_notifier.dart';
import '../widgets/day_compose.dart';
import '../widgets/last_update_counter.dart';
import '../widgets/weather_now.dart';

class WeatherForecast extends ConsumerWidget {
  const WeatherForecast({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weather = ref.watch(weatherForecastProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Weather forecast with flutter",
          style: AppTextStyles.scaffoldBarHeader.copyWith(color: Colors.black),
        ),
        backgroundColor: AppColors.bgScaffold,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Expanded(
              child: LocationStorage(),
            ),
          ],
        ),
      ),
      backgroundColor: AppColors.bgSurface,
      body: SafeArea(
        child: Center(
          child: weather.when(
            data: (data) {
              if (data.forecast.isEmpty) return const Text('No forecast, select the location', style: AppTextStyles.textLarge);
              return ListView(
                children: [
                  WeatherNow(
                    forecast: data.forecast,
                    location: weather.value!.location,
                  ),

                  const SizedBox(height: 15),

                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: LastUpdateCounter(
                        location: weather.value!.location,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  for (var i = 0; i < data.forecast.length; i++) DayCompose(day: data.forecast[i], utcOffsetSeconds: data.location?.utcOffsetSeconds),
                ],
              );
            },
            loading: () => Column(
              mainAxisAlignment: .center,
              children: [
                Text('loading ...', style: AppTextStyles.textLarge),
                const SizedBox(height: 30),
                const CircularProgressIndicator(color: Colors.white),
              ],
            ),
            error: (err, _) => Column(
              mainAxisAlignment: .center,
              children: [
                Text('Error: $err', style: AppTextStyles.textSmall),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
