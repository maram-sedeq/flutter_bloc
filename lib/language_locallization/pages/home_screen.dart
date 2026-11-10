import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget{
  const HomeScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(),
      drawer: const Drawer(),
      body: Center(child: 
      Padding(padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: 
          const <Widget>[
            Text("Hello there !",
            style: TextStyle(fontSize: 25),
            textAlign: TextAlign.center,
             ),
             Text("This text will not be translated",
             style: TextStyle(fontSize: 25),
             textAlign: TextAlign.center,
             )
          ],
      ),
      ),
      ),
       floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: const Icon(Icons.add),
        ),
     );
  }
}