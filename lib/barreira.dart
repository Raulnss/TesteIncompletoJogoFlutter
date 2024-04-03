import 'package:flutter/material.dart';

class barreira extends StatelessWidget {
  final barricadex;     
  final barricadey;      
  final barricadewidth;
  final barricadexhigth;
  barreira({
    required this.barricadex,    
    required this.barricadey,      
    required this.barricadewidth,
    required this.barricadexhigth,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment((2 * barricadex + barricadewidth) / (2 - barricadewidth),(2 * barricadey + barricadexhigth) / (2 - barricadexhigth)),
      child: Container(
        height: MediaQuery.of(context).size.height * 2 / 3 * barricadexhigth / 2,
        width: MediaQuery.of(context).size.width * barricadewidth / 2,
        child: Image.asset(
          "asset/image/image.png",
          fit: BoxFit.fill,
          ),
      ),
    );
  }
}