import 'package:flutter/material.dart';
import 'package:flutter_bloc_learn/language_locallization/pages/app_locallization.dart';


class HomeScreen extends StatelessWidget{
  const HomeScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("Home",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed:(){},
            icon: Icon(Icons.settings,color: Colors.white,)
          )
        ],
      ),
      drawer: const Drawer( ),
      body: Center(child: 
      Padding(padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: 
           <Widget>[
            Text(AppLocalelizations.of(context)!.translate("hello_msg"),
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
        backgroundColor: Colors.pink,
        onPressed: (){},
        child: const Icon(Icons.add,color: Colors.white,),
        ),
     );
  }
}