// ignore_for_file: unused_local_variable

import 'package:covid19app/Services/Utilities/state_services.dart';
import 'package:covid19app/view/detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';

class CoutriesList extends StatefulWidget {
  const CoutriesList({Key? key}) : super(key: key);

  @override
  State<CoutriesList> createState() => _CoutriesListState();
}

TextEditingController searchcontroller = TextEditingController();

class _CoutriesListState extends State<CoutriesList> {
  @override
  Widget build(BuildContext context) {
    StateServices stateServices = StateServices();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        // automaticallyImplyLeading: true,
        actions: [],
        // Theme.of(context).scaffoldBackgroundColor
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                onTap: () {
                  setState(() {});
                },
                controller: searchcontroller,
                decoration: InputDecoration(
                  hintText: 'Search with country name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(55.0),
                  ),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                  future: stateServices.countriesListApi(),
                  builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                    if (!snapshot.hasData) {
                      return ListView.builder(
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Shimmer.fromColors(
                                baseColor: Colors.grey.shade700,
                                highlightColor: Colors.grey.shade100,
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: Container(
                                          width: 80,
                                          height: 10,
                                          color: Colors.white),
                                      leading: Container(
                                          width: 50,
                                          height: 50,
                                          color: Colors.white),
                                      subtitle: Container(
                                          width: 89,
                                          height: 10,
                                          color: Colors.white),
                                    ),
                                  ],
                                ));
                          });
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            String name = snapshot.data![index]['country'];
                            if (searchcontroller.text.isEmpty) {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: (() {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailScreen(
                                            image: snapshot.data![index]
                                                ['countryInfo']['flag'],
                                            name: snapshot.data![index]
                                                ['country'],
                                            totalCases: snapshot.data![index]
                                                ['cases'],
                                            totalRecovered: snapshot
                                                .data![index]['recovered'],
                                            totalDeaths: snapshot.data![index]
                                                ['deaths'],
                                            active: snapshot.data![index]
                                                ['active'],
                                            test: snapshot.data![index]
                                                ['tests'],
                                            todayRecovered: snapshot
                                                .data![index]['todayRecovered'],
                                            critical: snapshot.data![index]
                                                ['critical'],
                                          ),
                                        ),
                                      );
                                    }),
                                    child: ListTile(
                                      title: Text(
                                          snapshot.data![index]['country']),
                                      subtitle: Text(snapshot.data![index]
                                              ['cases']
                                          .toString()),
                                      leading: Image(
                                          width: 50,
                                          height: 50,
                                          image: NetworkImage(
                                              snapshot.data![index]
                                                  ['countryInfo']['flag'])),
                                    ),
                                  ),
                                ],
                              );
                            } else if (name.toLowerCase().contains(
                                searchcontroller.text.toLowerCase())) {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: (() {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailScreen(
                                            image: snapshot.data![index]
                                                ['countryInfo']['flag'],
                                            name: snapshot.data![index]
                                                ['country'],
                                            totalCases: snapshot.data![index]
                                                ['cases'],
                                            totalRecovered: snapshot
                                                .data![index]['recovered'],
                                            totalDeaths: snapshot.data![index]
                                                ['deaths'],
                                            active: snapshot.data![index]
                                                ['active'],
                                            test: snapshot.data![index]
                                                ['tests'],
                                            todayRecovered: snapshot
                                                .data![index]['todayRecovered'],
                                            critical: snapshot.data![index]
                                                ['critical'],
                                          ),
                                        ),
                                      );
                                    }),
                                    child: ListTile(
                                      title: Text(
                                          snapshot.data![index]['country']),
                                      subtitle: Text(snapshot.data![index]
                                              ['cases']
                                          .toString()),
                                      leading: Image(
                                          width: 50,
                                          height: 50,
                                          image: NetworkImage(
                                              snapshot.data![index]
                                                  ['countryInfo']['flag'])),
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return Container();
                            }
                          });
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
