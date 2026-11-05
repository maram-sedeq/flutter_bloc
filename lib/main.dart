import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learn/bloc/counter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc_learn/pages/home_page.dart';

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
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    ),);
  }
}

