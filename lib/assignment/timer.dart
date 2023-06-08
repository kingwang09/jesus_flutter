import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: PomoTimerHome(),
  ));
}

class PomoTimerHome extends StatefulWidget {
  const PomoTimerHome({super.key});

  @override
  State<StatefulWidget> createState() {
    return _pomoTimerState();
  }
}

class _pomoTimerState extends State<PomoTimerHome> {
  int _completeRound = 0;
  int _completeGoal = 0;

  int _remainSeconds = 0;
  int _remainMinitues = 0;

  bool _isRunning = false;
  bool _isRestTime = false;

  void runTimer() {
    print("run timer...");
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_isRunning) {
        print("run second...");
        calcDisplay();
      } else {
        print("run close..");
        timer.cancel();
      }
    });
  }

  void calcDisplay() {
    setState(() {
      if (_remainMinitues != 0 && _remainSeconds == 0) {
        _remainMinitues--;
        _remainSeconds = 59;
      } else if (_remainMinitues == 0 && _remainSeconds == 0) {
        //타이머 종료 시 -> round 추가 및 계산
        calcCompleteRoundAndGoal();
      } else {
        _remainSeconds--;
      }
    });
  }

  void calcCompleteRoundAndGoal() {
    if (_isRestTime) {
      //휴식시간 끝났으면 종료
      _isRunning = false;
    } else {
      _completeRound++;

      //휴식 시간 설정
      _isRestTime = true;
      _remainMinitues = 5;
    }

    if (_completeRound == 4) {
      _completeRound = 0;
      _completeGoal++;
    }
  }

  void changeTimer({required int miniute}) {
    print("change time: $miniute");

    if (!_isRunning) {
      //중복 타이머 호출 안되도록 방어 처리
      runTimer();
    }

    setState(() {
      _remainMinitues = miniute;
      _remainSeconds = 0;
      _isRunning = true;
      _isRestTime = false;
    });
  }

  void toggle() {
    print("toggle: _isRunning=$_isRunning");
    if (!_isRunning) {
      //중복 타이머 호출 안되도록 방어 처리
      runTimer();
    }

    setState(() {
      _isRunning = !_isRunning;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.all(40.0),
              child: Text(
                "POMOTIMER",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 120,
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Center(
                    child: Text(
                      "$_remainMinitues",
                      style: const TextStyle(
                          fontSize: 60,
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Text(
                  ":",
                  style: TextStyle(
                    fontSize: 43,
                    color: Colors.black.withOpacity(0.3),
                  ),
                ),
                Container(
                  width: 100,
                  height: 120,
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Center(
                    child: Text(
                      "$_remainSeconds",
                      style: const TextStyle(
                          fontSize: 60,
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: OutlinedButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.white),
                      ),
                      onPressed: () {
                        changeTimer(miniute: 1);
                      },
                      child: const Text(
                        "15",
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 20,
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ElevatedButton(
                      onPressed: () {
                        changeTimer(miniute: 20);
                      },
                      child: const Text("20")),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ElevatedButton(
                      onPressed: () {
                        changeTimer(miniute: 25);
                      },
                      child: const Text("25")),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ElevatedButton(
                      onPressed: () {
                        changeTimer(miniute: 30);
                      },
                      child: const Text("30")),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ElevatedButton(
                      onPressed: () {
                        changeTimer(miniute: 35);
                      },
                      child: const Text("35")),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: IconButton(
                color: Colors.white,
                onPressed: toggle,
                icon: _isRunning
                    ? const Icon(Icons.pause)
                    : const Icon(Icons.play_arrow),
                iconSize: 100,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: Column(
                    children: [Text("$_completeRound/4"), const Text("ROUND")],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 100),
                  child: Column(
                    children: [Text("$_completeGoal/12"), const Text("GOAL")],
                  ),
                ),
              ],
            ),
          ]),
    );
  }
}
