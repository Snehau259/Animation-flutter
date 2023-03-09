import 'dart:math';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  double circleRadius = 200;
  final Tween<double> backgroundScale = Tween<double>(begin: 0.0, end: 1.0);
  AnimationController? starController;
  void initState() {
    super.initState();
    starController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 4,
      ),
    );
    starController!.repeat();

  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue,
      body: Container(
        child: Stack(
          clipBehavior: Clip.none,
          children: [pageBackground(), basicCircularBouncingButton(),starIcon()],
        ),
      ),
    );
  }

  Widget pageBackground() {
    return TweenAnimationBuilder(
        tween: backgroundScale,
        duration: Duration(seconds: 2),
        builder: (context, value, child) {
          return Transform.scale(
            scale: value,
            child: child,
          );
        },
        curve: Curves.fastLinearToSlowEaseIn,
        child: Container(
          color: Colors.black,
        ));
  }

  Widget basicCircularBouncingButton() {
    return Center(
      child: GestureDetector(
        onTap: () {
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
  Widget starIcon() {
    return AnimatedBuilder(
      animation: starController!.view,
      builder: (_buildContext, _child) {
        return Transform.rotate(
          angle: starController!.value * 2 * pi,
          child: _child,
        );
      },
      child: const Icon(
        Icons.star,
        size: 100,
        color: Colors.white,
      ),
    );
  }
}


