import 'package:flutter/material.dart';

class UserTheme {
  final Color primary;
  final Color secondary;
  final Color success;
  final Color info;
  final Color warning;
  final Color danger;
  final Color background;
  final Color text;
  final Color white;

  UserTheme({
    required this.primary,
    required this.secondary,
    required this.success,
    required this.info,
    required this.warning,
    required this.danger,
    required this.background,
    required this.text,
    required this.white,
  });
}

final userTheme = UserTheme(
  primary: const Color(0xFF2563EB),
  secondary: const Color(0xFF0E49CA),
  success: const Color(0xff17B889),
  info: const Color(0xFF6792F1),
  warning: const Color(0xFFE08420),
  danger: const Color(0xffDC2626),
  background: const Color(0xffFFFFFF),
  text: const Color(0xff272727),
  white: const Color(0xFFFFFFFF),
);

class AppColors {
  final UserTheme theme;

  AppColors(this.theme);

  // Direct access
  Color get primary => theme.primary;
  Color get secondary => theme.secondary;
  Color get success => theme.success;
  Color get info => theme.info;
  Color get warning => theme.warning;
  Color get danger => theme.danger;
  Color get background => theme.background;
  Color get text => theme.text;
  Color get white => theme.white;

  // Derived colors using existing _lighten and _darken methods with precise values
  Color get primaryLight => const Color(0xFFEAF0FD); // lightblue - calculated from primary
  Color get primaryDark => secondary; // blueMoreTextColor
  Color get borderGray => const Color(0xFF3D5066); // checkBoxBorderGray - specific gray
  Color get cardBackground => background;
  Color get errorBackground => const Color(0xffFFF0F0); // lightRed - light version of danger
  Color get formFill => _lighten(text, 0.85); // formFieldgrayfillColor
  Color get subtitleText => _lighten(text, 0.45); // grayTextColors

  // Gray colors derived from text using existing _lighten method
  Color get lightGray => _lighten(text, 0.75);
  Color get veryLightGrayFormField => _lighten(text, 0.9);
  Color get grayBorderColor => _lighten(text, 0.8);
  Color get formFieldgrayTextColor => _lighten(text, 0.5);
  Color get formFieldgrayfillColor => _lighten(text, 0.85);
  Color get formFieldgraySecondBorderColor => _lighten(text, 0.7);
  Color get grayTextColors => _lighten(text, 0.45);

  // Success/Green variants - light versions of success color
  Color get lightgreenColor => const Color(0xFFEDFAF5); // specific light green
  Color get lightgreenTeal => _lighten(success, 0.4);

  // Warning/Yellow variants using existing method
  Color get lightYellow => _lighten(warning, 0.4);

  // Other specific colors - some calculated, some fixed
  Color get redWaveColor => const Color(0xFFC75266); // specific red wave color
  Color get starColor => const Color(0xFFFFCF3D); // specific yellow for stars
  Color get offersColor => lightgreenColor;
  Color get timeLineColor => borderGray;
  Color get gradientTealColor => const Color(0xff00E096); // specific gradient color
  // Utility light/dark functions (existing methods)
Color _lighten(Color color, double amount) {
  final hsl = HSLColor.fromColor(color);
  final lightened =
      hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
  return lightened.toColor();
}

}

final colors = AppColors(userTheme);

class MainColors {
  static final blueTextColor = colors.primary;
  static final lightgreenColor = colors.lightgreenColor;
  static final redWaveColor = colors.redWaveColor;
  static final blueMoreTextColor = colors.secondary;
  static final checkBoxBorderGray = colors.borderGray;
  static final blackText = colors.text;
  static final white = colors.white;
  static final scaffoldWhite = colors.background;
  static final yellow = colors.warning;
  static final whiteCyan = colors.info;
  static final lightblue = colors.primaryLight;
  static final greenTeal = colors.success;
  static final lightgreenTeal = colors.lightgreenTeal;
  static final red = colors.danger;
  static final lightRed = colors.errorBackground;
  static final lightYellow = colors.lightYellow;
  
  // Gray colors - now exactly matching the old values
  static final transparentColor = Colors.transparent;
  static final lightGray = colors.lightGray;
  static final veryLightGrayFormField = colors.veryLightGrayFormField;
  static final grayBorderColor = colors.grayBorderColor;
  static final formFieldgrayTextColor = colors.formFieldgrayTextColor;
  static final formFieldgrayfillColor = colors.formFieldgrayfillColor;
  static final formFieldgraySecondBorderColor = colors.formFieldgraySecondBorderColor;
  static final grayTextColors = colors.grayTextColors;
  
  static final offersColor = colors.offersColor;
  static final starColor = colors.starColor;
  static final timeLineColor = colors.timeLineColor;
  static final black = colors.text;
  static final gradientTealColor = colors.gradientTealColor;
}