import 'package:flutter/material.dart';
import 'package:flutter_navigator/screenB.dart';

class ScreenA extends StatelessWidget {
  const ScreenA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("ScreenA Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'ScreenA Page!!!',
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/b");
                },
                child: Text("Go to ScreenB")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/c');
                },
                child: Text("Go to ScreenC"))
          ],
        ),
      ),
    );
  }
}
