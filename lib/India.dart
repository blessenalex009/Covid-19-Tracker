import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class India extends StatefulWidget {
  @override
  _IndiaState createState() => _IndiaState();
}

class _IndiaState extends State<India> {
  final String url = "https://api.covid19india.org/data.json";

  List indiaData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  Future getJsonData() async {
    var response = await http.get(Uri.encodeFull(url));
    //  print(response.body);
    List converttojson = json.decode(response.body)['statewise'];
    // print("OUR LIST: $converttojson");

    setState(() {
      indiaData = converttojson;
      isLoading = false;
    });
    
  }

  

  @override
  Widget build(BuildContext context) {
    return (Container(
      child: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: indiaData == null ? 0 : indiaData.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 20.0,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Container(
                          margin: EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "   " + "${indiaData[index]['state']}",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              ),
                              Text(
                                "Confirmed Cases : " +
                                    " " +
                                    "${indiaData[index]['confirmed']}",
                              ),
                              Text(
                                "Active Cases : " +
                                    " " +
                                    "${indiaData[index]['active']}",
                              ),
                              Text(
                                "Total Deaths : " +
                                    " " +
                                    "${indiaData[index]['deaths']}",
                              ),
                              Text(
                                "Recovered : " +
                                    " " +
                                    "${indiaData[index]['recovered']}",
                              ),
                            ],
                          ),
                        )),
                      ],
                    ),
                  );
                }),
      ),
    ));
  }
}
