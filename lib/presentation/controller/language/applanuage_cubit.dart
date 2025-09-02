import 'package:eazifly_student/presentation/controller/language/applanuage_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

class AppLanguageCubit extends Cubit<ApplanuageState> {
  AppLanguageCubit() : super(ApplanuageInitial());
  AppLanguageCubit get(context) => BlocProvider.of(context);

  static bool isArabic(BuildContext context) =>
      Localizations.localeOf(context).languageCode == "ar";
  String langKey = "code";
  void getAppLang() async {
    var hasStoredData = GetStorage().hasData(langKey);
    String localeCode = "ar";
    if (hasStoredData) {
      localeCode = GetStorage().read(langKey);
    }
    emit(AppLanguageCurrentState(locale: localeCode));
  }

  void storeLanguage({required String languageCode}) async {
    GetStorage().write(langKey, languageCode);
    emit(AppLanguageCurrentState(locale: languageCode));
  }
}
