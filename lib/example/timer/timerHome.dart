

import 'dart:async';

import 'package:flutter/material.dart';

class TimerHome extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _TimerHomeState();
  }
}

class _TimerHomeState extends State<TimerHome>{
  final int TIMER_MIN = 30;
  DateTime? _start;
  DateTime? _end;
  String _display = "00:00";
  bool _isRunning = false;

  void start(){
    print("start=$start, isRun=$_isRunning");

    if(_isRunning == false){//이미 동작 중이면 스케줄 실행되지 않도록 개선
      _start = DateTime.now();
      _end = _start!.add(Duration(minutes: TIMER_MIN , seconds: 1));//1초를 더해줘야함. timer가 1초 후에 돌아가기 때문
      runTimer();
    }else{
      print("이미 실행 중입니다.");
    }
    updateIsRunning(true);
  }

  void end(){
    updateIsRunning(false);
    updateDisplay(DateTime.now());
  }

  void updateIsRunning(bool isRunning){
    //setState(() {
    //  _isRunning = isRunning;
    //});
    _isRunning = isRunning;
  }

  void updateDisplay(DateTime start){
    Duration duration = _end!.difference(start);
    print("current: display=$duration, isRunning=$_isRunning");
    setState(() {
      _display = "${duration.inMinutes}:${duration.inSeconds % 60}";//분:초
    });
  }

  void runTimer() async{
    Timer.periodic(Duration(seconds: 1), (timer) {
      Duration duration = _end!.difference(DateTime.now());
      print("run timer duration: ${duration.inSeconds}");
      if(duration.inSeconds == 0){//timer 종료시 끝.
        print("finish..");
        updateDisplay(DateTime.now());
        updateIsRunning(false);
        timer.cancel();
      }

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