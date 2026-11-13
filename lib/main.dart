//import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:material_ui/material_ui.dart';
//import 'package:flutter_bloc_learn/counter_app/pages/home_page.dart';
//import 'package:flutter_bloc_learn/counter_app/bloc/counter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learn/cubit/locale_cubit.dart';
import 'package:flutter_bloc_learn/language_locallization/pages/app_locallization.dart';
import 'package:flutter_bloc_learn/language_locallization/pages/home_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

 void main() {
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //this returne is for the counter app
   /* return BlocProvider(create: (context) => CounterBloc(),
    child: MaterialApp(
    home: // HomePage(),//counter_app
     */
return MultiBlocProvider(
  providers: [
    BlocProvider(
      create: (context) => LocaleCubit()..getSavedLanguage(),
    ),
   
  ],
  child: BlocBuilder<LocaleCubit, ChangeLocalState>(
        builder: (context, state) {
          return MaterialApp( 
     locale: state.locale,
     supportedLocales: [
      Locale('en', ),
      Locale('ar',),
     ],
     localizationsDelegates: [
      AppLocalelizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
     ],
     localeResolutionCallback:(devicelocale,supportedLocales){
      for(var locale in supportedLocales){
        if (devicelocale != null && 
        devicelocale.languageCode == locale.languageCode){
        return devicelocale;
      }
      }
      
      return supportedLocales.first;
     },
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
    
          }
      )
);
  
    //);
  }
}