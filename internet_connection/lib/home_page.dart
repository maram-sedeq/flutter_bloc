import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:internet_connection/bloc/internet_bloc.dart';
import 'package:internet_connection/cubit/internet_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 255, 113, 165),
        ),
        //BlocBuilder<InternetBloc, InternetState>(

        // body: BlocBuilder<InternetCubit, InternetState>(
        //   builder: (context, state){
        //     if(state is ConnectedState){
        //      return _buildTextWidget(state.message);
        //     }
        //     else if(state is NotConnectedState){
        //      return _buildTextWidget(state.message);
        //     }
        //     return const Text("didn't work");
        //   }
        // ),

        ////if you want it as snack bar
       body:  BlocConsumer<InternetCubit, InternetState>(
          listener: (context, state) {
            if (state is NotConnectedState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message),
                  backgroundColor: Color.fromARGB(255, 255, 113, 165),));
            }
          },
          builder: (context, state) {
            if (state is ConnectedState) {
              return _buildTextWidget(state.message);
            } else if (state is NotConnectedState) {
              return _buildTextWidget(state.message);
            }
            return const Text("didn't work");
          },
        ),
      ),
    );
  }

  Widget _buildTextWidget(String message) {
    return Center(child: Text(message));
  }
}
