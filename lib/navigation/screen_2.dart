// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:covid19app/navigation/screen_three.dart';
import 'package:covid19app/navigation/ytils/routs_name.dart';
import 'package:flutter/material.dart';

class ScreenTwo extends StatefulWidget {
//passing data with routs
  dynamic data;
//passing data with navigator.push
  // final String Name;
  // final int Num;
  ScreenTwo({
    required this.data,
    // required this.Name,
    // required this.Num,
    Key? key,
  }) : super(key: key);

  @override
  State<ScreenTwo> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<ScreenTwo> {
  @override
  Widget build(BuildContext context) {
    // final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.data['name'] + "  " + widget.data['age'].toString()),
        // arguments['name']
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RoutName.screenThree);
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => ScreenThree(
                // Name: arguments['name'],
                // Num: arguments['age'],
                // )));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.cyan,
                ),
                height: 50,
                child: Center(child: Text('Screen 2')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
