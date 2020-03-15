import 'package:flutter/material.dart';
import './MainHeader.dart';

class PlannedRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new MainHeader(
          title: new Text('Your route'),
        ),
        body: Container(
            child: Column(
          children: <Widget>[
            Text('TEEESSTTTT'),
          ],
        )));
  }
}
