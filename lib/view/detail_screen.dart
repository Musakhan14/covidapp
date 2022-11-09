// ignore_for_file: must_be_immutable, implementation_imports

import 'package:covid19app/view/world_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen(
      {required this.totalRecovered,
      required this.totalDeaths,
      required this.active,
      required this.critical,
      required this.image,
      required this.name,
      required this.test,
      required this.todayRecovered,
      required this.totalCases,
      Key? key})
      : super(key: key);

  String name;
  String image;
  int totalCases,
      totalDeaths,
      totalRecovered,
      active,
      critical,
      todayRecovered,
      test;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .078),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .09,
                      ),
                      ReuseableRow(
                          title: 'Cases', value: widget.totalCases.toString()),
                      ReuseableRow(
                          title: 'Recovered',
                          value: widget.totalRecovered.toString()),
                      ReuseableRow(
                          title: 'Deaths',
                          value: widget.totalDeaths.toString()),
                      ReuseableRow(
                          title: 'Criticals',
                          value: widget.critical.toString()),
                      ReuseableRow(
                          title: 'Today Recovered',
                          value: widget.todayRecovered.toString()),
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(widget.image),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
