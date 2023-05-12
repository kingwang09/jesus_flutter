import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '스켈레톤',
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget{
  List<Widget> list = List.empty(growable: true);

  MyHome({super.key});
  @override
  Widget build(BuildContext context){
    for(var i = 0; i < 100; i++){
      list.add(Text("sample data = ${i + 1}"));
    }
    return Scaffold(
      appBar: AppBar(
        leading: null,
        title: const Text('List View using list'),
        actions: [],
      ),
      body: ListView(
        children: list,
      ),
    );
  }
}