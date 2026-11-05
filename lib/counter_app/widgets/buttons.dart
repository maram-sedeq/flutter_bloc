import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learn/counter_app/bloc/counter_bloc.dart';

class ButtonWidget extends StatelessWidget{
  const ButtonWidget ({Key ? key}): super (key: key);

@override
Widget build(BuildContext context){
  print('Button Rebuilt');//Test Only the widget displaying the counter text rebuilds on state emission
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      FloatingActionButton(onPressed: (){
        BlocProvider.of<CounterBloc>(context).add(IncreamentEvent());
      },
      child: const Icon(Icons.add),),
      
      const SizedBox(height: 10,),

      FloatingActionButton(onPressed: (){
        BlocProvider.of<CounterBloc>(context).add(ResentEvent());
      },
      child: const Icon(Icons.exposure_zero),),

      const SizedBox(height: 10,),

      FloatingActionButton(onPressed: (){
        BlocProvider.of<CounterBloc>(context).add(DecreamentEvent());
      },
      child: const Icon(Icons.remove),),
    ],
  );
}

}