import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection/bloc/internet_bloc.dart';

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
        body: BlocBuilder<InternetBloc, InternetState>(
          builder: (context, state){
            if(state is ConnectedState){
             return _buildTextWidget(state.message);
            }
            else if(state is NotConnectedState){
             return _buildTextWidget(state.message);
            }
            else{
              return SizedBox(height: 10,);
            }
          }
        ),
      ),
    );
  }

  Widget _buildTextWidget(String message) {
    return Center(child: Text(message));
  }
}
