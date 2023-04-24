
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyListViewApp());
}

class MyListViewApp extends StatelessWidget{
  const MyListViewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ListView App example",
      home: MyListViewAppHome(),
    );
  }

}

class MyListViewAppHome extends StatelessWidget{
  final List<String> values = [
      "What shall we say then? Shall we continue in sin, that grace may abound?",
      "God forbid. How shall we, that are dead to sin, live any longer therein?",
      "Know ye not, that so many of us as were baptized into Jesus Christ were baptized into his death?"
  ];

  MyListViewAppHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListVew Example"),
      ),
      body: ListView.builder(
          itemBuilder: (context, position){//items의 position으로 접근하여 사용.
            return Center(
                child: Text(values[position]),
            );
          },
          itemCount: values.length,
      ),
    );
  }
}