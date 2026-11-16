import 'package:material_ui/material_ui.dart';

abstract interface class AppColors {
  static const Color bgScaffold = Colors.amber;
  static const Color bgSurface = Color(0xFF06305E);
  static const Color bgWeatherCard = Colors.blueGrey;
  static const Color bgLocation = Color(0xFF8198B1);
  static const Color bgLocationActive = Colors.amber;
  static const Color iconsTint = Colors.black12;
  static const Color descriptionText = Colors.white;
  static const Color buttonColor = Colors.white;
}

abstract interface class AppSpacing {
  static const double small = 4;
  static const double medium = 8;
  static const double large = 16;
}

abstract interface class AppFontSizes {
  static const double small = 10;
  static const double medium = 14;
  static const double large = 16;
  static const double extraLarge = 24;
}

abstract interface class AppIconSizes {
  static const double small = 20;
  static const double medium = 30;
  static const double large = 40;
  static const double extraLarge = 100;
}

abstract interface class AppTextStyles {
  static const TextStyle scaffoldBarHeader = TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: AppColors.descriptionText);
  static const TextStyle textSmall = TextStyle(fontSize: AppFontSizes.small, fontWeight: FontWeight.normal, color: AppColors.descriptionText);
  static const TextStyle textMedium = TextStyle(fontSize: AppFontSizes.medium, fontWeight: FontWeight.normal, color: AppColors.descriptionText);
  static const TextStyle textLarge = TextStyle(fontSize: AppFontSizes.large, fontWeight: FontWeight.normal, color: AppColors.descriptionText);
  static const TextStyle textExtraLarge = TextStyle(
    fontSize: AppFontSizes.extraLarge,
    fontWeight: FontWeight.normal,
    color: AppColors.descriptionText,
  );
}
