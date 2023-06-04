import 'dart:async';

import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({super.key});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  String time = "00 : 00 : 00";
  Timer? timer;
  Stopwatch stopwatch = Stopwatch();

  List<Widget> recordedTimes = [];

  void updateTime(int milliseconds) {
    setState(() {
      int totalSeconds = milliseconds ~/ 1000;
      int seconds = totalSeconds % 60;
      int minutes = totalSeconds ~/ 60 % 60;
      int hours = totalSeconds ~/ 3600;

      time =
          '${addZero(hours.toString())} : ${addZero(minutes.toString())} : ${addZero(seconds.toString())}';
    });
  }

  String addZero(String input) {
    while (input.length < 2) {
      input = '0$input';
    }
    return input;
  }

  void start() {
    if (timer != null && timer!.isActive) return;
    stopwatch.start();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      updateTime(stopwatch.elapsedMilliseconds);
    });
  }

  void stop() {
    stopwatch.stop();
    timer?.cancel();
    timer = null;
  }

  void record() {
    setState(() {
      recordedTimes.insert(
          0,
          Container(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: Text(
              time,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ));
    });
  }

  void reset() {
    stopwatch.reset();
    updateTime(stopwatch.elapsedMilliseconds);
  }

  void clear() {
    setState(() {
      recordedTimes = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          time,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: start,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text(
                "Start",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            ElevatedButton(
              onPressed: stop,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text(
                "Stop",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            ElevatedButton(
              onPressed: reset,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              child: const Text("Reset",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: record,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
              ),
              child: const Text("Record",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )),
            ),
            const SizedBox(
              width: 20,
            ),
            ElevatedButton(
              onPressed: clear,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: const Text("Clear",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ],
        ),
        SizedBox(
          height: 90,
          child: SingleChildScrollView(
            // reverse: true,
            scrollDirection: Axis.vertical,
            child: Column(
              children: recordedTimes,
            ),
          ),
        )
      ],
    );
  }
}
