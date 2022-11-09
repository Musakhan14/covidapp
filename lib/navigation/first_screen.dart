// ignore_for_file: prefer_const_constructors

import 'package:covid19app/navigation/screen_2.dart';
import 'package:covid19app/navigation/ytils/routs_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Screen 1'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.popAndPushNamed(context, RoutName.screenTwo,
                    arguments: {
                      'name': 'Musa Khann',
                      'age': 23,
                    });
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => ScreenTwo(
                //               Name: 'Musa Khan',
                //               Num: 755,
                //             )));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.cyan,
                ),
                height: 50,
                child: Center(child: Text('Screen 1')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
