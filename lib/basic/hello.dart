
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: "Flutter Demo Home page...")
    );
  }

}

class MyHomePage extends StatelessWidget{
  String title;

  MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(title, textAlign: TextAlign.center,));
  }
}