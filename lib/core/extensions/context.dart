import 'package:eazifly_student/core/lang/app_localizations.dart';
import 'package:flutter/material.dart';

extension Ctx on BuildContext {
  AppLocalizations? get loc => AppLocalizations.of(this);
}


