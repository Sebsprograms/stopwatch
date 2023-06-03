import 'package:flutter/material.dart';
import 'package:stopwatch/stop_watch.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 66, 93, 151),
            Color.fromARGB(255, 29, 19, 116),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: StopWatch(),
    );
  }
}
