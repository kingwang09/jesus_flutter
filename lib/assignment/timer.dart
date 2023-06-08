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
  final int _completeRound = 0;
  final int _completeGoal = 0;

  int _remainSeconds = 0;
  int _remainMinitues = 0;

  bool _isRunning = false;

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
        _isRunning = false;
      } else {
        _remainSeconds--;
      }
    });
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
    });
  }

  void toggle() {
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
      body: Column(children: [
        const Text("pomo Timer"),
        const SizedBox(
          height: 100,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$_remainMinitues"),
            const Text(":"),
            Text("$_remainSeconds"),
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
              child: ElevatedButton(
                  onPressed: () {
                    changeTimer(miniute: 15);
                  },
                  child: const Text("15")),
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
        IconButton(onPressed: toggle, icon: const Icon(Icons.play_circle)),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 100),
              child: Column(
                children: const [Text("0/4"), Text("ROUND")],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 100),
              child: Column(
                children: const [Text("0/12"), Text("GOAL")],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
