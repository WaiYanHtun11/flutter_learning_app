import 'dart:ui';

import 'package:flutter/material.dart';
class TextDemo extends StatelessWidget {
  const TextDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 350,
        height: 200,
        alignment: Alignment.center,
        color: Colors.orange,
        child: const Text(
          'This is some text This is some text This is some text',
          style: TextStyle(
            color: Colors.deepOrange,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            letterSpacing: 5,
            decoration: TextDecoration.lineThrough,
          ),
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
