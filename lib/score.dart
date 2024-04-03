import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  final bestscore;
  final score;
  Score({
    this.bestscore,
    this.score,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Image.asset("asset/image/score.png", width: 60,),
                Text(
                  score.toString(),
                  style: const TextStyle(color: Colors.blue, fontSize: 30),
                )
            ],
          ),
          Column(
           children: [
            Image.asset("asset/image/record.png", width: 45,),
            Text(
              bestscore.toString(),
              style: const TextStyle(color: Colors.blue, fontSize: 30),
            )
           ],
          )
        ],
      ),
    );
  }
  
}