import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learn/language_locallization/pages/app_locallization.dart';
import 'package:flutter_bloc_learn/language_locallization/pages/home_screen.dart';
import 'cubit/local_cubit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:material_ui/material_ui.dart';
//import 'package:flutter_bloc_learn/counter_app/pages/home_page.dart';
//import 'package:flutter_bloc_learn/counter_app/bloc/counter_bloc.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  /*Widget build(BuildContext context) {
    return BlocProvider(create: (context) => CounterBloc(),
    child: const MaterialApp(
      home:
    // HomePage(),//counter_app
      debugShowCheckedModeBanner: false,
    ),);
  }*/
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocaleCubit()..getSavedLanguage(),
        ),
      ],
      child: BlocBuilder<LocaleCubit, ChangeLocaleState>(
        builder: (context, state) {
          return MaterialApp(
            locale: state.locale,
            supportedLocales: const [Locale('en'), Locale('ar')],
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            localeResolutionCallback: (deviceLocale, supportedLocales) {
              for (var locale in supportedLocales) {
                if (deviceLocale != null &&
                    deviceLocale.languageCode == locale.languageCode) {
                  return deviceLocale;
                }
              }

              return supportedLocales.first;
            },
            debugShowCheckedModeBanner: false,
            home: const HomeScreen(),
          );
  },
      ),
    );
}
}
