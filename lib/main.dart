// ignore_for_file: prefer_const_constructors

import 'package:covid19app/navigation/screen_2.dart';
import 'package:covid19app/navigation/screen_three.dart';
import 'package:covid19app/navigation/ytils/routs_name.dart';
import 'package:covid19app/view/splash_screen.dart';
import 'package:flutter/material.dart';

import 'navigation/first_screen.dart';
import 'navigation/ytils/routs.dart';
import 'view/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryTextTheme: TextTheme(
          bodySmall: TextStyle(color: Colors.white),
          labelMedium: TextStyle(color: Colors.white),
        ),
        primaryColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      // initialRoute: FirstScreen.id,
      // routes: {
      //   FirstScreen.id: (context) => FirstScreen(),
      //   ScreenTwo.id: (context) => ScreenTwo(),
      //   ScreenThree.id: (context) => ScreenThree(),
      // // },
      // initialRoute: RoutName.SplashScreen,
      // onGenerateRoute: Routes.generateRoute,
    );
  }
}
