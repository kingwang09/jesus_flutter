import 'dart:convert' as convert;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main(){
  runApp(MyBibleListViewApp());
}

class MyBibleListViewApp extends StatelessWidget{
  const MyBibleListViewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ListView App example",
      home: MyBibleListViewAppHome(),
    );
  }

}

class MyBibleListViewAppHome extends StatefulWidget{

  MyBibleListViewAppHome({super.key});

  @override
  State<StatefulWidget> createState() {
    return _bibleState();
  }
}

class _bibleState extends State<MyBibleListViewAppHome>{
  late List<String> values;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    values = new List.empty(growable: true);
    getJson();
  }

  Future<String> getJson() async{
    var url = Uri.http('kingwang09.koreacentral.cloudapp.azure.com:9999', '/bible/text', {'version': 'KOREAN_IMPROVE', 'index':'롬', 'chapter':'2'});
    print("url=$url");

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      //
      var jsonResponse = utf8.decode(response.bodyBytes);
      List<dynamic> jsonResponseList = convert.jsonDecode(jsonResponse) as List<dynamic>;
      print('jsonResponse: $jsonResponseList');
      List<String> converted = new List.empty(growable: true);
      for(var value in jsonResponseList){
        converted.add(value);
      }
      setState(() {
        values?.addAll(converted);
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return response.body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListVew Example"),
      ),
      body: ListView.builder(
        itemBuilder: (context, position){//items의 position으로 접근하여 사용.
          var text = "${position + 1} ${values[position]}";
          return Text(text, style: TextStyle(fontSize: 25),);
        },
        itemCount: values.length,
      ),
    );
  }

}