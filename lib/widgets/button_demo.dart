import 'package:flutter/material.dart';
class ButtonDemo extends StatelessWidget {
  const ButtonDemo({super.key});
  @override
  Widget build(BuildContext context) {
    void showSnackBar(){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Button Clicked'),
          duration: Duration(milliseconds: 1000),
        )
      );
    }

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
                onPressed: showSnackBar,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  shadowColor: Colors.red,
                  elevation: 10,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)
                    )
                  )
                ),
                child: const Text('Elevated Button')
            ),
            const ElevatedButton(
                onPressed: null,
                child: Text('Disable Button')
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            OutlinedButton(
                onPressed: ()=> showSnackBar(),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  shadowColor: Colors.blueAccent,
                  elevation: 20,
                  minimumSize: const Size(150, 70),
                  side: const BorderSide(
                      color: Colors.orangeAccent,
                      width: 2,
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  )
                ),
                child: const Text('Outline Button')
            ),
            const OutlinedButton(onPressed: null, child: Text('Disable Button')),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
                onPressed: showSnackBar,
                child: const Text('Text Button')
            ),
            const TextButton(
                onPressed: null,
                child: Text('Disable Button')
            )
          ],
        ),
        Row(
          children: [
            GestureDetector(
              onTap: showSnackBar,
              child: Container(
                width: 150,
                height: 50,
                alignment: Alignment.center,
                color: Colors.orangeAccent,
                child: const Text('Custom Button'),
              ),
            ),
            IconButton(
                onPressed: showSnackBar,
                icon: const Icon(Icons.add_call)
            )
          ],
        ),
      ],
    );
  }
}
