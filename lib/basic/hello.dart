
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  var switchValue = false;

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: "Flutter Demo",
  //     theme: ThemeData(
  //       primaryColor: Colors.blue,
  //       visualDensity: VisualDensity.adaptivePlatformDensity,
  //     ),
  //     darkTheme: ThemeData.light(),
  //     home: _MyApp();
  //   );
  // }

  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp>{
  var switchValue = false;
  String buttonValue = "헬로우 버튼";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Flutter Demo",
        theme: ThemeData(
          primaryColor: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        darkTheme: ThemeData.light(),
        home: Scaffold(
          body: Center(
            child: ElevatedButton(
              child: Text('$buttonValue'),
              onPressed: () {
                setState(() {
                  buttonValue == "헬로우 버튼" ?
                    buttonValue = "월드 버튼" :
                    buttonValue = "헬로우 버튼";
                });
              },
            ),
            // child: Switch(
            //   value: switchValue,
            //   onChanged: (value) {
            //     setState(() {
            //       print(value);
            //       switchValue = value;
            //     });
            //   },
            // ),
          ),
        )
    );
  }
}

class MyHomePage extends StatelessWidget{
  String title;

  MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Center(
            child: Text(title,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blue, fontSize: 20),
            )
        )
    );
  }
}