import 'package:flutter/material.dart';
class PreviewScreen extends StatelessWidget {
  const PreviewScreen({super.key,required this.title,required this.demo});
  final String title;
  final Widget demo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: demo,
    );
  }
}
