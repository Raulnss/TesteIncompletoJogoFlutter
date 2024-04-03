import 'package:flutter/material.dart';

class clickToStart extends StatelessWidget {
  final bool gameHasStarted;
  clickToStart({
    required this.gameHasStarted
  });
  @override
  Widget build(BuildContext context) {
    return gameHasStarted
    ? Container()
    : Stack(
      children: [
        Container(
          alignment: const Alignment(0, 0),
          // child: Image.asset(name),
          child: Text("Start"),
        ),
        Container(
          alignment: const Alignment(0, -0.7),
          child: const Text(
            "super jogo",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
            ),
        )
      ],
    );
  }
}