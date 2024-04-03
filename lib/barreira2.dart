import 'package:flutter/material.dart';

class barreira2 extends StatelessWidget {
  final barricadex2;     
  final barricadey2;      
  final barricadewidth2;
  final barricadexhigth2;
  barreira2({
    required this.barricadex2,    
    required this.barricadey2,      
    required this.barricadewidth2,
    required this.barricadexhigth2,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment((2 * barricadex2 + barricadewidth2) / (2 - barricadewidth2),(2 * barricadey2 + barricadexhigth2) / (2 - barricadexhigth2)),
      child: Container(
        height: MediaQuery.of(context).size.height * 2 / 3 * barricadexhigth2 / 2,
        width: MediaQuery.of(context).size.width * barricadewidth2 / 2,
        child: Image.asset(
          "asset/image/image.png",
          fit: BoxFit.fill,
          ),
      ),
    );
  }
}