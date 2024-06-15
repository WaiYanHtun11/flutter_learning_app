import 'package:flutter/material.dart';
import 'package:flutter_learning_app/preview_screen.dart';
import 'package:flutter_learning_app/widgets/icon_demo.dart';
import 'package:flutter_learning_app/widgets/text_demo.dart';
import 'package:flutter_learning_app/widgets/typography_demo.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    Widget buildTitle(String title,List<Widget> subtitle){
      return Card(
        elevation: 20,
        color: Colors.white,
        surfaceTintColor: Colors.white,
        child: ExpansionTile(
            title: Text(title),
            children: subtitle
        ),
      );
    }
    Widget buildSubTitle(String subtitle,Widget demo,String path){
      return ListTile(
        title: Text(subtitle),
        onTap: (){
          Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => PreviewScreen(title: subtitle, demo: demo, path: path)
              )
          );
        },
        trailing: const Icon(Icons.chevron_right),
      );
    }
    
    final List<Widget> widgets = [
      buildSubTitle('Icon',const IconDemo(),'widgets/icon_demo.dart'),
      buildSubTitle('Text', const TextDemo(),'widgets/text_demo.dart'),
      buildSubTitle('Typography', const TypographyDemo(),'widgets/typography_demo.dart')
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Catalog'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildTitle('Widgets', widgets)
          ],
        ),
      ),
    );
  }
}
