import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themes_app/bloc/theme_bloc.dart';
import 'package:themes_app/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      create: (context) => ThemeBloc()..add(GetCurrentThemeEvent()),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
         if(state is LoadThemeState){
           return  MaterialApp(
            theme: state.themeData,
            debugShowCheckedModeBanner: false,
            title: 'Theme App',
            home: HomePage(),
          );
         }
         
          return Container();
        },
      ),
    );
  }
}
