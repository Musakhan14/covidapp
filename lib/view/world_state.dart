// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:covid19app/Model/WorldStateModel1.dart';
import 'package:covid19app/Services/Utilities/state_services.dart';
import 'package:covid19app/view/countries_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStateScreen extends StatefulWidget {
  const WorldStateScreen({Key? key}) : super(key: key);

  @override
  State<WorldStateScreen> createState() => _WorldStateScreenState();
}

class _WorldStateScreenState extends State<WorldStateScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();
  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  final colorList = <Color>[
    const Color(0xff4285f4),
    const Color(0xff1aa260),
    const Color(0xffde5246),
  ];

  @override
  Widget build(BuildContext context) {
    StateServices stateServices = StateServices();
    return Scaffold(
      // backgroundColor: Colors.black,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .06,
            ),
            FutureBuilder(
                future: stateServices.fetchWorldStateRecord(),
                builder: (context, AsyncSnapshot<WorldStateModel1> snapshot) {
                  if (!snapshot.hasData) {
                    return Expanded(
                      child: SpinKitFadingCircle(
                        color: Colors.black,
                        size: 50,
                        controller: _animationController,
                      ),
                    );
                  } else {
                    return Column(
                      children: [
                        PieChart(
                            chartValuesOptions: ChartValuesOptions(
                                showChartValuesInPercentage: true),
                            animationDuration: Duration(milliseconds: 1400),
                            colorList: colorList,
                            baseChartColor: Colors.white,
                            chartType: ChartType.ring,
                            chartRadius:
                                MediaQuery.of(context).size.width / 3.2,
                            emptyColor: Colors.white,
                            legendOptions: LegendOptions(
                              legendPosition: LegendPosition.left,
                            ),
                            dataMap: {
                              'Total': double.parse(
                                  snapshot.data!.cases!.toString()),
                              'Recover': double.parse(
                                  snapshot.data!.recovered!.toString()),
                              'Deaths': double.parse(
                                  snapshot.data!.deaths!.toString()),
                            }),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.height * .06),
                          child: Card(
                            child: Column(
                              children: [
                                ReuseableRow(
                                    title: 'Total',
                                    value: snapshot.data!.cases!.toString()),
                                ReuseableRow(
                                    title: 'Deaths',
                                    value: snapshot.data!.deaths!.toString()),
                                ReuseableRow(
                                    title: 'Recovered',
                                    value:
                                        snapshot.data!.recovered!.toString()),
                                ReuseableRow(
                                    title: 'Active',
                                    value: snapshot.data!.active!.toString()),
                                ReuseableRow(
                                    title: 'Critical',
                                    value: snapshot.data!.critical!.toString()),
                                ReuseableRow(
                                    title: 'Today Deaths',
                                    value:
                                        snapshot.data!.todayDeaths!.toString()),
                                ReuseableRow(
                                    title: 'Today Recoverd',
                                    value: snapshot.data!.todayRecovered!
                                        .toString()),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CoutriesList()));
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color(0xff1aa260),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(child: Text('Track Countries')),
                          ),
                        ),
                      ],
                    );
                  }
                }),
          ],
        ),
      )),
    );
  }
}

class ReuseableRow extends StatelessWidget {
  ReuseableRow({required this.title, required this.value, Key? key})
      : super(key: key);
  String title, value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}
