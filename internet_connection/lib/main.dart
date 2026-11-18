import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection/bloc/internet_bloc.dart';
import 'package:internet_connection/cubit/internet_cubit.dart';
import 'package:internet_connection/home_page.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetCubit()..checkConnection() ,
      //create: (context) => InternetBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
