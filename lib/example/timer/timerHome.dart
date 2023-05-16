

import 'package:flutter/material.dart';

class TimerHome extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _TimerHomeState();
  }
}

class _TimerHomeState extends State<TimerHome>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Timer Example"),
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.height * 0.5,
            height: MediaQuery.of(context).size.width * 0.5,
            child: Center(
              child: Text(
                  "00:00",
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
              ),
            ),
          ),
          ElevatedButton(onPressed: ()=>{},
              child: Text("시작하기"),
          )
        ],
      ),
    );
  }

}