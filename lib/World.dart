import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class World extends StatefulWidget {
  @override
  _WorldState createState() => _WorldState();
}

class _WorldState extends State<World> {
  final String url = "https://corona.lmao.ninja/v2/countries";
  List countriesData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  Future getJsonData() async {
    var response = await http.get(Uri.encodeFull(url));
    //  print(response.body);
    setState(() {
      var converttojson = json.decode(response.body);
      countriesData = converttojson;
      isLoading = false;
    });
    //print(countriesData);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: countriesData == null ? 0 : countriesData.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 20.0,
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(20.0),
                          child: Image(
                            width: 90.0,
                            height: 70.0,
                            fit: BoxFit.contain,
                            image: NetworkImage(
                                countriesData[index]['countryInfo']['flag']),
                          ),
                        ),
                        Expanded(
                            child: Container(
                          margin: EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Country : " +
                                  " " +
                                  "${countriesData[index]['country']}"),
                              Text("Total Cases : " +
                                  " " +
                                  "${countriesData[index]['cases']}"),
                              Text("Today Cases : " +
                                  " " +
                                  "${countriesData[index]['todayCases']}"),
                              Text("Total Deaths : " +
                                  " " +
                                  "${countriesData[index]['deaths']}"),
                              Text("Today Deaths : " +
                                  " " +
                                  "${countriesData[index]['todayDeaths']}"),
                              Text("Recovered : " +
                                  " " +
                                  "${countriesData[index]['recovered']}"),
                              Text("Tests done/million : " +
                                  " " +
                                  "${countriesData[index]['tests']}"),
                            ],
                          ),
                        )),
                      ],
                    ),
                  );
                }),
      ),
    );
  }
}

/*
Container(
        child: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : ListView.builder(
                  itemCount: countriesData == null ? 0 : countriesData.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 20.0,
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(20.0),
                            child: Image(
                              width: 90.0,
                              height: 70.0,
                              fit: BoxFit.contain,
                              image: NetworkImage(
                                  countriesData[index]['countryInfo']['flag']),
                            ),
                          ),
                          Expanded(
                              child: Container(
                            margin: EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Country : " +
                                    " " +
                                    "${countriesData[index]['country']}"),
                                Text("Total Cases : " +
                                    " " +
                                    "${countriesData[index]['cases']}"),
                                Text("Today Cases : " +
                                    " " +
                                    "${countriesData[index]['todayCases']}"),
                                Text("Total Deaths : " +
                                    " " +
                                    "${countriesData[index]['deaths']}"),
                                Text("Today Deaths : " +
                                    " " +
                                    "${countriesData[index]['todayDeaths']}"),
                                Text("Recovered : " +
                                    " " +
                                    "${countriesData[index]['recovered']}"),
                                Text("Tests done/million : " +
                                    " " +
                                    "${countriesData[index]['tests']}"),
                              ],
                            ),
                          )),
                        ],
                      ),
                    );
                  }),
        ),
      )
      */
