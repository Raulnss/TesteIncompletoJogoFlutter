import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:primeiro_jogo/inicio.dart';

void main(List<String> args) {
  runApp(inicio());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
  ]);
}