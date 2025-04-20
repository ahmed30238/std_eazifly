import 'package:eazifly_student/presentation/controller/language/applanuage_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

class ApplanuageCubit extends Cubit<ApplanuageState> {
  ApplanuageCubit() : super(ApplanuageInitial());
  ApplanuageCubit get(context) => BlocProvider.of(context);

  static bool isArabic(BuildContext context) =>
      Localizations.localeOf(context).languageCode == "ar";
  String langKey = "lang";
  void getAppLang() async {
    var hasStoredData = GetStorage().hasData(langKey);
    String localeCode = "en";
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
