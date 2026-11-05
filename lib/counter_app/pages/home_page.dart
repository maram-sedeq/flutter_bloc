//HomePage.dart 
//bloc_counter app

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learn/counter_app/bloc/counter_bloc.dart';
import '../widgets/buttons.dart';

class HomePage extends StatelessWidget{
const HomePage ({Key ? key}): super (key: key);

@override
Widget build(BuildContext){
  print('Counter Text Widget Rebuilt');
  return Scaffold(
    body: Center(
     child:
       BlocBuilder<CounterBloc, CounterState>(builder: (context, state){
        if(state is CounterInitial){
       return const Text("0",
       style:  TextStyle(fontSize: 30),);
        }
        else if(state is CounterValueState){
        
       return Text(state.counter.toString(),
       style: const TextStyle(fontSize: 30),);
        }
        else{
          return SizedBox(height: 10,);
        }
       },)
       
    ),
    floatingActionButton: const ButtonWidget(),
  );
}
}