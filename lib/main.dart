import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc_learn/counter_app/pages/home_page.dart';
import 'package:flutter_bloc_learn/counter_app/bloc/counter_bloc.dart';
import 'package:flutter_bloc_learn/language_locallization/pages/home_screen.dart';


void main() {
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => CounterBloc(),
    child: const MaterialApp(
     
     // HomePage(),//counter_app
     supportedLocales: [
      Locale('en', ),
      Locale('ar',),
     ],
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    ),);
  }
}