// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ScreenThree extends StatefulWidget {
  // final String Name;
  // final int Num;
  const ScreenThree({
    // required this.Name,
    // required this.Num,
    Key? key,
  }) : super(key: key);

  @override
  State<ScreenThree> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<ScreenThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Musa'),
        // widget.Name + widget.Num.toString()
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.cyan,
              ),
              height: 50,
              child: Center(child: Text('Screen 3')),
            ),
          ],
        ),
      ),
    );
  }
}
