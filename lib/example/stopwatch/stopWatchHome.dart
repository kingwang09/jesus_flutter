

import 'dart:async';

import 'package:flutter/material.dart';

class StopWatchHome extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _StopWatchHomeState();
  }
}

class _StopWatchHomeState extends State<StopWatchHome>{
  DateTime? _start;
  DateTime? _end;
  String _display = "00:00";
  bool _isRunning = false;

  void start(){
    print("start=$start, isRun=$_isRunning");

    if(_isRunning == false){//이미 동작 중이면 스케줄 실행되지 않도록 개선
      _start = DateTime.now();
      runTimer();
    }else{
      print("이미 실행 중입니다.");
    }
    updateIsRunning(true);
  }

  void end(){
    _end = DateTime.now();
    updateIsRunning(false);
    updateDisplay(_end!);
  }

  void updateIsRunning(bool isRunning){
    setState(() {
      _isRunning = isRunning;
    });
  }

  void updateDisplay(DateTime end){
    Duration duration = end.difference(_start!);
    print("current: display=$duration, isRunning=$_isRunning");

    setState(() {
      _display = "${duration.inMinutes}:${duration.inSeconds % 60}";//분:초
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