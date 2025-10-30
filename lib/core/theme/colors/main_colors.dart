import 'package:flutter/material.dart';

class MainColors {
  // User Customizable Colors (5 colors maximum)
  static Color _userPrimary = const Color(0xFF84A63D);
  static Color _userSecondary = const Color(0xFF305157);
  static Color _userAccent = const Color(0xFFA4C94F);
  static Color _userBackground = const Color(0xFFFAFCF8);
  static Color _userSurface = const Color(0xFFFFFFFF);

  // Method to update user colors
  static void updateUserColors({
    Color? primary,
    Color? secondary,
    Color? accent,
    Color? background,
    Color? surface,
  }) {
    if (primary != null) _userPrimary = primary;
    if (secondary != null) _userSecondary = secondary;
    if (accent != null) _userAccent = accent;
    if (background != null) _userBackground = background;
    if (surface != null) _userSurface = surface;
  }

  // Helper methods to generate colors from user colors
  static Color _lighten(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    return hsl
        .withLightness((hsl.lightness + amount).clamp(0.0, 1.0))
        .toColor();
  }

  static Color _darken(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    return hsl
        .withLightness((hsl.lightness - amount).clamp(0.0, 1.0))
        .toColor();
  }

  static Color _adjustSaturation(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    return hsl
        .withSaturation((hsl.saturation + amount).clamp(0.0, 1.0))
        .toColor();
  }

  // Primary Brand Colors (derived from user colors)
  static Color get primary => _userPrimary;
  static Color get primaryLight => _lighten(_userPrimary, 0.4);
  static Color get secondary => _userSecondary;
  static Color get secondaryDark => _darken(_userSecondary, 0.2);

  // Border and Input Colors (auto-generated from primary)
  static Color get borderPrimary => _lighten(_userPrimary, 0.35);
  static Color get accent => _userAccent;

  // System Colors (Fixed - Not customizable)
  static const warning = Color(0xFFFFD130);
  static const error = Color(0xFFB91C1C);
  static const success = Color(0xFF17B889);
  static const onError = Color(0xFFFFF0F0);
  static const onSuccess = Color(0xFFE8F8F3);

  // Utility Colors (derived from user colors)
  static const transparent = Colors.transparent;
  static Color get surface => _userBackground;
  static Color get onSurface => _darken(_userSecondary, 0.1);
  static Color get surfaceVariant => _lighten(_userBackground, 0.02);
  static Color get inputFill => MainColors.onPrimary.withValues(alpha: .04);
  static Color get outline => _lighten(_userPrimary, 0.35);
  static Color get onSurfaceVariant =>
      _adjustSaturation(_darken(_userSecondary, 0.05), -0.1);
  static Color get surfaceContainerHighest => _lighten(_userBackground, 0.02);
  static Color get outlineVariant => _lighten(_userPrimary, 0.35);

  // Text and contrast colors (auto-generated)
  static Color get muted =>
      _adjustSaturation(_darken(_userSecondary, 0.05), -0.1);
  static Color get onSurfaceSecondary =>
      _adjustSaturation(_darken(_userSecondary, 0.05), -0.1);
  static Color get onPrimary => _getContrastColor(_userPrimary);
  static Color get onSecondary => _getContrastColor(_userSecondary);
  static Color get background => _userBackground;
  static Color get surface2 => _userSurface;

  // Tertiary color (derived from accent)
  static Color get tertiary => _adjustSaturation(_userAccent, 0.2);
  static Color get onTertiary => _getContrastColor(tertiary);
  static Color get gradient => _userPrimary;

  // Helper to determine if white or black text should be used
  static Color _getContrastColor(Color color) {
    // Calculate relative luminance
    double luminance = color.computeLuminance();
    return luminance < 0.5 ? const Color(0xFF000000) : const Color(0xFFFFFFFF);
  }

  // Method to reset to default colors
  static void resetToDefaults() {
    _userPrimary = const Color(0xFF84A63D);
    _userSecondary = const Color(0xFF305157);
    _userAccent = const Color(0xFFA4C94F);
    _userBackground = const Color(0xFFFAFCF8);
    _userSurface = const Color(0xFFFFFFFF);
  }

  // Method to get current user colors (for saving/loading)
  static Map<String, Color> getUserColors() {
    return {
      'primary': _userPrimary,
      'secondary': _userSecondary,
      'accent': _userAccent,
      'background': _userBackground,
      'surface': _userSurface,
    };
  }

  // Method to set all user colors at once
  static void setUserColors(Map<String, Color> colors) {
    _userPrimary = colors['primary'] ?? _userPrimary;
    _userSecondary = colors['secondary'] ?? _userSecondary;
    _userAccent = colors['accent'] ?? _userAccent;
    _userBackground = colors['background'] ?? _userBackground;
    _userSurface = colors['surface'] ?? _userSurface;
  }
}
