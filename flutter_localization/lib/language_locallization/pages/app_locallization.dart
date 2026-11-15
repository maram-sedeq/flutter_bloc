import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///First delegate
class AppLocalelizations {
  final Locale? locale;
  new({required this.locale});

  static AppLocalelizations? of(BuildContext context){
    return Localizations.of<AppLocalelizations>(context, AppLocalelizations);
  }
  static LocalizationsDelegate<AppLocalelizations> delegate = _AppLocalizationsDelegate();
  late Map<String, String> _localizedString;



  Future loadJsonLanguage() async{
    String jsonString =
    await rootBundle.loadString("assets/lang/${locale!.languageCode}.json");

  
  Map<String, dynamic> jsonMap = json.decode(jsonString);
  _localizedString = jsonMap.map((key, value){
    return MapEntry(key, value.toString());
  });
  }

String translate(String key)=>_localizedString[key]??"";
}
 
///Second delegate
class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalelizations> {
  const _AppLocalizationsDelegate();
  
  @override
  bool isSupported(Locale locale) {
    /// TODO: implement isSupported, Is local supported or not? and we already have this functoin in main()
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalelizations> load(Locale locale) async{
    // TODO: implement load لغة الهاتف الحالية 
    AppLocalelizations localelizations = AppLocalelizations(locale: locale);
    await localelizations.loadJsonLanguage();
    return localelizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalelizations> old)=>false;
   // TODO: implement shouldReload يعيد تحميل الملفات مع كل تحديث واجهة
   
  }

  extension TranslateX on String{
    String tr(BuildContext context){
      return AppLocalelizations.of(context)!.translate(this);
    }
  }

