// ignore_for_file: prefer_const_constructors

import 'package:covid19app/navigation/first_screen.dart';
import 'package:covid19app/navigation/screen_2.dart';
import 'package:covid19app/navigation/screen_three.dart';
import 'package:covid19app/navigation/ytils/routs_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutName.firstScreen:
        return MaterialPageRoute(builder: (context) => FirstScreen());
      case RoutName.screenTwo:
        return MaterialPageRoute(
            builder: (context) => ScreenTwo(
                  data: settings.arguments as Map,
                ));
      case RoutName.screenThree:
        return MaterialPageRoute(builder: (context) => ScreenThree());

      default:
        return MaterialPageRoute(builder: (context) {
          return Scaffold(
            body: Center(child: Text('No Rout Define')),
          );
        });
    }
  }
}
