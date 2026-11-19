import 'package:flutter/material.dart';

enum AppTheme {
  pinkLight("Pink Light"),
  pinkDark("Pink Dark"),
  purpleDark("Purple Dark");

  const AppTheme(this.name);
  final String name;
}

final appThemeData = {
  AppTheme.pinkLight: ThemeData( 
    appBarTheme:  AppBarTheme(backgroundColor: Colors.pink[200]),
    brightness: Brightness.light,
    primaryColor: Colors.pink[200],
  ),
  AppTheme.pinkDark: ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: Colors.pink[400]),
    brightness: Brightness.dark,
    primaryColor: Colors.pink[400],
  ),
  AppTheme.purpleDark: ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: Colors.purple[700]),
    brightness: Brightness.dark,
    primaryColor: Colors.purple[700],
  ),
};
