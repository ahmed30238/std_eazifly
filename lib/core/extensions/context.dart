import 'package:flutter/material.dart';

import '../lang/app_localizations.dart';

extension LocalizationExtensions on BuildContext {
  AppLocalizations? get loc => AppLocalizations.of(this);

  String get languageCode => Localizations.localeOf(this).languageCode;

  bool get isArabicLanguage => languageCode == 'ar';
}
