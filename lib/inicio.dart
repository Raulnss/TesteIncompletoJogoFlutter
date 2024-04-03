import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:primeiro_jogo/jogo.dart';

class inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Jogo do Raul",
    home: jogo(),
   );
  }
}