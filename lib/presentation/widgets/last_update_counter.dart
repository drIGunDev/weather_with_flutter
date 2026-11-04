import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/themes.dart';
import '../../services/location/state/last_update_counter.dart';
import '../../services/location/types/location.dart';
import '../formatters/last_update_format.dart';

final class const LastUpdateCounter({
  super.key,
  required final Location? location,
}) extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (location == null) return const SizedBox();

    return _lastUpdateCounterBuilder(ref.watch(forecastLastUpdateCounter(location!)));
  }
}

Widget _lastUpdateCounterBuilder(AsyncValue<int> counter) {
  return counter.when(
    data: (data) => _lastUpdateText(data),
    loading: () => Text('loading ...', style: AppTextStyles.textSmall),
    error: (err, stack) => Text('Error: $err', style: AppTextStyles.textSmall),
  );
}

Widget _lastUpdateText(int lastUpdate) {
  return Text(formatLastUpdate(Duration(seconds: lastUpdate)), style: AppTextStyles.textSmall);
}
