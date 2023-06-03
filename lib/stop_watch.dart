import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({super.key});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  String time = "00:00:00:00";

  List<Widget> recordedTimes = [];

  void start() {}

  void stop() {}

  void record() {
    setState(() {
      recordedTimes.add(Container(
        padding: const EdgeInsets.only(
          top: 10,
        ),
        child: Text(
          time,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ));
    });
  }

  void reset() {
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
                backgroundColor: Colors.blue,
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
        SizedBox(
          height: 90,
          child: SingleChildScrollView(
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
