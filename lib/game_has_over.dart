import 'package:flutter/material.dart';

class gameHasOver extends StatelessWidget {
  bool gamehasover;
  gameHasOver({
    required this.gamehasover,
  });
  @override
  Widget build(BuildContext context) {
    return gamehasover 
    ?  Stack(
      children: [
        Container(
          alignment: const Alignment(0, -0.7),
          child: const Text(
            'Deu ruim',
            style: TextStyle(
              color: Colors.red,
              fontSize: 40,
              ),
            ),
        ),
      ],
    )
    : Container();
  }
}