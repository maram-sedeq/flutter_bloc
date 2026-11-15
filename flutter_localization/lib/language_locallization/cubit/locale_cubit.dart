import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_learn/language_locallization/pages/language_cache_helper.dart';
import 'package:material_ui/material_ui.dart';
import 'package:meta/meta.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<ChangeLocalState> {
  LocaleCubit() : super(ChangeLocalState(locale: Locale('en')));

  Future<void> getSavedLanguage() async{
  final String cachedLanguageCode = await LanguageCacheHelper().getCacheLanguageCode(); 
await LanguageCacheHelper().getCacheLanguageCode();
  emit(ChangeLocalState(locale: Locale(cachedLanguageCode)));
  }
  Future<void> changeLanguage(String languageCode) async{
    await LanguageCacheHelper().cacheLanguageCode(languageCode);
    emit(ChangeLocalState(locale: Locale(languageCode)));
     
  }
}


