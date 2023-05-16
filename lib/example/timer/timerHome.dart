

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
    int diffMinute = _start!.minute - end.minute;
    int diffSeconds = _start!.second - end.second;
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
                  _display,
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
              ),
            ),
          ),
          Row(
            children: [
              ElevatedButton(onPressed: start,
                child: Text("시작하기"),
              ),
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