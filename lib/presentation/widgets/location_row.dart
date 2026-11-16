import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/themes.dart';
import '../../services/location/types/location.dart';

class const LocationRow({
  super.key,
  required final Location? _location,
  final void Function()? _onDelete,
  final void Function()? _onTap,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isActive = _location?.isActive == true;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Material(
        color: Colors.transparent,
        child: Consumer(
          builder: (context, ref, _) {
            return Card(
              color: isActive ? AppColors.bgLocationActive : AppColors.bgLocation,
              child: InkWell(
                splashColor: Colors.blue,
                borderRadius: BorderRadius.circular(AppSpacing.large),
                onTap: () {
                  _onTap?.call();
                },
                child: Container(
                  padding: const EdgeInsets.all(AppSpacing.medium),
                  decoration: BoxDecoration(),
                  child: Row(
                    crossAxisAlignment: .center,
                    children: [
                      Icon(
                        Icons.place,
                        size: 22,
                        color: AppColors.iconsTint,
                      ),

                      const SizedBox(width: 8),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: .start,
                          children: [
                            if (_location != null) ...[
                              Text(
                                _location.name,
                                style: AppTextStyles.textMedium.copyWith(fontWeight: .bold, color: isActive ? Colors.black : Colors.white),
                              ),

                              const SizedBox(height: 2),

                              Text(
                                '${_location.city}, ${_location.country}',
                                style: AppTextStyles.textSmall.copyWith(color: isActive ? Colors.black : Colors.white),
                              ),
                            ] else ...[
                              Text(
                                'Select location',
                                style: AppTextStyles.textMedium.copyWith(fontWeight: .bold),
                              ),
                            ],
                          ],
                        ),
                      ),
                      if (_onDelete != null && _location != null) ...[
                        const Spacer(),

                        IconButton(
                          icon: Icon(Icons.delete, size: 22, color: Colors.red[900]),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Delete location: ${_location.name}'),
                                content: Text('Are you sure you want to delete this location?'),
                                actions: [
                                  TextButton(
                                    child: Text('Cancel'),
                                    onPressed: () => Navigator.of(context).pop(),
                                  ),
                                  TextButton(
                                    child: Text('Delete'),
                                    onPressed: () {
                                      _onDelete();
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
