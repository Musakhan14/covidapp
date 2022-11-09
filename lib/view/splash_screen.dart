// ignore_for_file: sized_box_for_whitespace

import 'dart:async';
import 'dart:math' as math;

import 'package:covid19app/view/world_state.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();
  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 5),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const WorldStateScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
                animation: _animationController,
                child: Container(
                  width: 200,
                  height: 200,
                  child: const Center(
                    child: Image(image: AssetImage('images/virus.png')),
                  ),
                ),
                builder: (BuildContext context, Widget? child) {
                  return Transform.rotate(
                    angle: _animationController.value * 2.0 * math.pi,
                    child: child,
                  );
                }),
            SizedBox(height: MediaQuery.of(context).size.height * .08),
            const Align(
                alignment: Alignment.center,
                child: Center(
                  child: Text(
                    '  Covid-19\nTracker App',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
