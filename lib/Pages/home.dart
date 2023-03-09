import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
  // final int _circleRadius = 200;
}

class _MyHomePageState extends State<MyHomePage> {
  double circleRadius = 200;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            basicCircularBouncingButton()
          ],
        ),
      ),
      // appBar: AppBar(backgroundColor: Colors.red[500],

      //   title: Text(widget.title),
      // ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Center basicCircularBouncingButton() {
    return Center(
            child: GestureDetector(
              onTap: () {
                // print("Tapped");
                setState(changeRadius);
              },
              child: AnimatedContainer(
                duration: Duration(seconds: 2),
                height: circleRadius,
                width: circleRadius,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(circleRadius),
                  color: Colors.purple[500],
                ),
                curve: Curves.bounceInOut,
                child: Center(
                  child: Text("Basic",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
            ),
          );
  }

  void changeRadius() {
    circleRadius = circleRadius == 200 ? 400 : 200;
  }
}
