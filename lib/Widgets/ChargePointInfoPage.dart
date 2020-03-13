import 'package:flutter/material.dart';
import '../Requests/GetPlaces.dart';
import './MainHeader.dart';

class ChargePointInfoPage extends StatefulWidget {
  @override
  InfoPageState createState() => InfoPageState();
}

class InfoPageState extends State<ChargePointInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new MainHeader(
        title: new Text("Chargy"),
      ),
      body: new ListView(),
    );
  }
}
