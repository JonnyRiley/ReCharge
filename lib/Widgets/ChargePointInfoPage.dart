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
    return FutureBuilder(
        future: fetchPlaces(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: MainHeader(
                title: Text("Chargy"),
              ),
              body: ListView(
                children: createPlaceTileList(snapshot.data),
              ),
            );
          } else {
            return Text("Loading...");
          }
        });
  }
}

List<Widget> createPlaceTileList(placeList) {
  List<Widget> placeTileList = List();
  Widget currentTile;
  placeList.forEach((place) {
    currentTile = Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.purple[300], width: 2.0),
          gradient: LinearGradient(
              colors: [Colors.purple[100], Colors.purple[200]],
              begin: Alignment.topLeft),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(17.5)),
      child: ListTile(
          title: Text(place.name, style: ,), subtitle: Text("${place.rating} out of 5")),
    );
    placeTileList.add(currentTile);
  });
  return placeTileList;
}
