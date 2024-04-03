import 'package:flutter/material.dart';

class dino extends StatelessWidget {
  final double dinox;
  final double dinoy;
  final double dinowidth;
  final double dinohigth;
  dino({
    required this.dinox,
    required this.dinoy,
    required this.dinowidth,
    required this.dinohigth,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment((2 * dinox + dinowidth) / (2-dinowidth), (2 * dinoy + dinohigth) / (2 - dinohigth)),
      child: Container(
        height: MediaQuery.of(context).size.height * 2 / 3 * dinohigth / 2,
        width: MediaQuery.of(context).size.width * dinowidth / 2,
        child: Image.asset(
          "asset/image/homi.png",
          fit: BoxFit.fill,
          ),
      ),
    );
  }
  
}