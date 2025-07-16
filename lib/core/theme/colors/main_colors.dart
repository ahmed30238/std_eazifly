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

  // Derived colors
  Color get primaryLight => _lighten(primary, 0.9);
  Color get primaryDark => _darken(primary, 0.2);
  Color get borderGray => _lighten(text, 0.8);
  Color get cardBackground => _lighten(background, 0.95);
  Color get errorBackground => _lighten(danger, 0.9);
  Color get formFill => _lighten(background, 0.98);
  Color get subtitleText => _darken(text, 0.2);

  // Gray colors derived from text color (اللون الرمادي مشتق من لون النص)
  Color get lightGray => _lighten(text, 0.85);
  Color get veryLightGrayFormField => _lighten(text, 0.95);
  Color get grayBorderColor => _lighten(text, 0.9);
  Color get formFieldgrayTextColor => _lighten(text, 0.4);
  Color get formFieldgrayfillColor => _lighten(text, 0.92);
  Color get formFieldgraySecondBorderColor => _lighten(text, 0.75);
  Color get grayTextColors => _lighten(text, 0.3);

  // Utility light/dark functions
  Color _lighten(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    final lightened =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
    return lightened.toColor();
  }

  Color _darken(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    final darkened =
        hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return darkened.toColor();
  }
}

final colors = AppColors(userTheme);

class MainColors {
  static final blueTextColor = colors.primary;
  static final lightgreenColor = colors.success;
  static final redWaveColor = colors.danger;
  static final blueMoreTextColor = colors.primaryDark;
  static final checkBoxBorderGray = colors.borderGray;
  static final blackText = colors.text;
  static final white = colors.white;
  static final scaffoldWhite = colors.background;
  static final yellow = colors.warning;
  static final whiteCyan = colors.info;
  static final lightblue = colors.primaryLight;
  static final greenTeal = colors.success;
  static final lightgreenTeal = colors.errorBackground;
  static final red = colors.danger;
  static final lightRed = colors.errorBackground;
  static final lightYellow = _lighten(colors.warning, 0.9);
  
  // Gray colors now derived from theme (الألوان الرمادية أصبحت مشتقة من الثيم)
  static final transparentColor = Colors.transparent;
  static final lightGray = colors.lightGray;
  static final veryLightGrayFormField = colors.veryLightGrayFormField;
  static final grayBorderColor = colors.grayBorderColor;
  static final formFieldgrayTextColor = colors.formFieldgrayTextColor;
  static final formFieldgrayfillColor = colors.formFieldgrayfillColor;
  static final formFieldgraySecondBorderColor = colors.formFieldgraySecondBorderColor;
  static final grayTextColors = colors.grayTextColors;
  
  static final offersColor = _lighten(colors.danger, 0.5);
  static final starColor = colors.warning;
  static final timeLineColor = colors.borderGray;
  static final black = colors.text;
  static final gradientTealColor = colors.success;
  
  // Utility function for light colors
  static Color _lighten(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    final lightened =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
    return lightened.toColor();
  }
}