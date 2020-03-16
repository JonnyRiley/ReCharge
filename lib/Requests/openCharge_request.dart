import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchChargePoints() async {
  final response = await http.get(
      'https://api.openchargemap.io/v3/poi/?output=json&countrycode=GB&maxresults=10&latitude=53.483959&longitude=-2.244644',
      headers: {
        HttpHeaders.userAgentHeader: '822f0d45-7a97-46f5-885f-3e1f98df00ba'
      });
  if (response.statusCode == 200) {
    var listOfChargePoints = jsonDecode(response.body);
    var body = listOfChargePoints
        .map((chargePoint) => ChargePoint.fromJson(chargePoint))
        .toList();

    return body;
  } else {
    throw Exception('Failed to load ChargePoint');
  }
}

class ChargePoint {
  final List<dynamic> connections;
  final double latitude;
  final double longitude;
  final int numPoints;
  final String title;
  final dynamic address;
  final String town;
  final dynamic postcode;

  const ChargePoint(this.connections, this.latitude, this.longitude,
      this.numPoints, this.title, this.address, this.town, this.postcode);

  ChargePoint.fromJson(Map jsonMap)
      : connections = jsonMap['Connections']
            .map((jsonConnection) => new Connection.fromJson(jsonConnection))
            .toList(),
        latitude = jsonMap['AddressInfo']['Latitude'],
        longitude = jsonMap['AddressInfo']['Longitude'],
        numPoints = jsonMap['NumberOfPoints'],
        title = jsonMap['AddressInfo']['Title'],
        address = jsonMap['AddressInfo']['AddressLine1'],
        town = jsonMap['AddressInfo']['Town'],
        postcode = jsonMap['AddressInfo']['Postcode'];
}

class Connection {
  final int amps;
  final int voltage;
  final double powerKw;
  final String type;
  final bool fastCharge;

  const Connection(
      this.amps, this.voltage, this.powerKw, this.type, this.fastCharge);

  Connection.fromJson(Map jsonMap)
      : amps = jsonMap['Amps'],
        voltage = jsonMap['Voltage'],
        powerKw = jsonMap['PowerKW'],
        type = jsonMap['ConnectionType']['Title'],
        fastCharge = jsonMap['Level']['IsFastChargeCapable'];
}

void main() => {
      fetchChargePoints().then((listOfChargePoints) => listOfChargePoints
          .forEach((chargePoint) => print(chargePoint.longitude))),
      runApp(MyApp())
    };

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<dynamic> futureChargePoint;

  @override
  void initState() {
    super.initState();
    futureChargePoint = fetchChargePoints();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<dynamic>(
            future: futureChargePoint,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text('snapshot.data.dataProvider');
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
