// import 'dart:ffi';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:primeiro_jogo/barreira.dart';
import 'package:primeiro_jogo/click_to_start.dart';
import 'package:primeiro_jogo/dino.dart';
import 'package:primeiro_jogo/game_has_over.dart';
import 'package:primeiro_jogo/score.dart';
class jogo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => jogoState();
}
class jogoState extends State<jogo> {
  bool gameHasStarted = false;
  bool gamehasover = false;
  bool centraljump = false;
  bool dinopassoubarreita = false;
  int score = 0;
  int bestscore = 0;
  double gravity =  9.8;
  double height = 0;
  double time = 0;
  double velocity = 5;
  double dinox = -0.5;
  double dinoy = 1;
  double dinowidth = 0.2;
  double dinohigth = 0.4;
  double barricadex = 1;
  double barricadey = 1;
  double barricadewidth = 0.2;
  double barricadexhigth = 0.4;
  void start(){
    setState(() {
      gameHasStarted = true;
    });
    Timer.periodic(const Duration(microseconds: 1), (timer) {
      timer.tick - 1;
      if (detectyColision()) {
        gamehasover = true;
        timer.cancel();
        setState(() {
          if (score > bestscore) {
            bestscore = score;
          }
        });
      }
      loopdasbarreiras();
      updateforscore();
      setState(() {
        barricadex -= 0.01;
      });
     });
  }
  void updateforscore(){
    if (barricadex < dinox && dinopassoubarreita == false) {
      setState(() {
        dinopassoubarreita = true;
        score ++;
        
      });
    }
  }
  void loopdasbarreiras(){
    setState(() {
      if (barricadex <= -1.2) {
        barricadex = 1.2;
        dinopassoubarreita = false; 
      }
    });
  }
  bool detectyColision(){
    if (barricadex <= dinox + dinowidth && barricadex + barricadewidth >= dinox && dinoy >= barricadey - barricadexhigth) {
      return true;
    }
    return false;
  }
  void jumpDino(){
    centraljump = true;
    Timer.periodic(const Duration(milliseconds: 10), (timer) {
      height = -gravity / 2 * time * time + velocity * time;
      setState(() {
        if (1 - height > 1) {
          resetjumpdino();
          dinoy = 1;
          timer.cancel();
        }
        else
        {
          dinoy = 1 - height;
        }
      });
      if (gamehasover) {
        timer.cancel();
      }
      time += 0.01;
     });
  }
  void resetjumpdino(){
    centraljump = false;
    time = 0;
  }
  void playgamenovo(){
    setState(() {
      gamehasover = false;
      gameHasStarted = false;
      barricadex = 1.2;
      score = 0;
      dinoy = 1;
      centraljump = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gamehasover
      ? (playgamenovo)
      : (gameHasStarted ? (centraljump ? null : jumpDino) : start),
    child: Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Center(
              child: Stack(
                children: [
                  clickToStart(
                    gameHasStarted: gameHasStarted,
                  ),
                  Score(
                   score: score,
                   bestscore: bestscore,
                  ),
                  dino(
                    dinox: dinox, 
                    dinoy: dinoy, 
                    dinowidth: dinowidth,
                    dinohigth: dinohigth,
                  ),
                  barreira(
                      barricadex: barricadex,
                       barricadey: barricadey,
                        barricadewidth: barricadewidth,
                         barricadexhigth: barricadexhigth,
                  ),
                  gameHasOver(
                    gamehasover: gamehasover,
                  ),
                ],
              ),
            )
          ),
          Expanded(
            flex: -2,
            child: Container(
              // color: Colors.black,
              // child: const Center(child: Text("Game",style: TextStyle(color: Colors.blue,fontSize: 22,fontWeight: FontWeight.bold,),),),
             width: 145,
             height: 145,            
            )
          ),
        ],
      ),
    ),
    );
  }
}