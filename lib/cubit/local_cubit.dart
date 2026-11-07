import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_learn/language_locallization/pages/language_cache_helper.dart';
import 'package:meta/meta.dart';

part 'local_state.dart';

class LocalCubit extends Cubit<LocalState> {
  LocalCubit() : super(LocalInitial());

  Future<void> getSavedLanguage() async{
     final String cachedLanguageCode = await LanguageCacheHelper().getCachedLanguageCode();
     emit(ChangedLocalState(locale: Locale(cachedLanguageCode)));
  }
  Future<void> changeLanguage(String languageCode)async {
    await LanguageCacheHelper().cacheLanguageCode(languageCode);
    emit(ChangedLocalState(locale: Locale(languageCode)));
  }
}
 