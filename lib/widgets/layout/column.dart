import 'package:flutter/material.dart';

void main(){
  runApp(const MyColumnApp());
}

//MaterialApp main class
class MyColumnApp extends StatelessWidget{
  const MyColumnApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyColumn(),
    );
  }
}

//MaterialApp home Class
class MyColumn extends StatelessWidget{
  const MyColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Column Demo...')
      ),
      body: Column(
        children: const [
          Text('그렇다면 유대인의 나은 점이 무엇이며 할례의 가치가 무엇입니까 ?'),
          Text('여러 모로 많이 있습니다. 우선 그들은 하나님의 말씀을 맡았습니다. '),
        ],
      ),
    );
  }
}