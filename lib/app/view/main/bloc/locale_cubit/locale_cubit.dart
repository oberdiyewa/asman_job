import 'package:asman_work/app/services/shared_prefs_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit(this.languageCode) : super(Locale(languageCode));
  
  final String languageCode;

  

  void setLocale(String localeCode) {
    SharedPrefsManager.instance!.setLangCode(localeCode);
    emit(Locale(localeCode));
  }
}
