import 'package:flutter/material.dart';
import 'package:flutter_learning_app/preview_screen.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    void gotoNextScreen(String title,Widget screen){
      Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => PreviewScreen(title: title, demo: screen)
          )
      );
    }
    
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
    Widget buildSubTitle(String subtitle,Widget screen){
      return ListTile(
        title: Text(subtitle),
        onTap: ()=> gotoNextScreen(subtitle,screen),
        trailing: const Icon(Icons.chevron_right),
      );
    }
    
    final List<Widget> widgets = [
      buildSubTitle('Icon',const Placeholder()),
      buildSubTitle('Text', const Placeholder()),
      buildSubTitle('Typography', const Placeholder())
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
