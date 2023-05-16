

import 'dart:async';

import 'package:flutter/material.dart';

class TimerHome extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _TimerHomeState();
  }
}

class _TimerHomeState extends State<TimerHome>{
  DateTime? _start;
  DateTime? _end;
  String _display = "00:00";
  bool _isRunning = false;

  void start(){
    _start = DateTime.now();
    _isRunning = true;
    runTimer();
  }

  void end(){
    _end = DateTime.now();
    _isRunning = false;
    updateIsRunning(_isRunning);
    updateDisplay(_end!);
  }

  void updateIsRunning(bool isRunning){
    setState(() {
      _isRunning = isRunning;
    });
  }

  void updateDisplay(DateTime end){
    int diffMinute = end.minute - _start!.minute;
    int diffSeconds = end.second - _start!.second;
    print("current: display=$diffMinute:$diffSeconds, isRunning=$_isRunning");

    setState(() {
      _display = "$diffMinute:$diffSeconds";
    });
  }

  void runTimer() async{
    Timer.periodic(Duration(seconds: 1), (timer) {
      if(_isRunning) {
        print("run second...");
        updateDisplay(DateTime.now());
      }else{
        print("run close..");
        timer.cancel();
      }
    });
  }

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
                  _display, //날짜값으로 하다보니 시점 값으로 계산되는 버그가 있음.
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: start,
                child: Text("시작하기"),
              ),

              const Padding(padding: EdgeInsets.all(10)),

              ElevatedButton(onPressed: end,
                child: Text("종료하기"),
              )
            ],
          )

        ],
      ),
    );
  }

}