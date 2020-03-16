import 'package:flutter/material.dart';
import '../Requests/GetPlaces.dart';
import './MainHeader.dart';

class ChargePointInfoPage extends StatefulWidget {
  double latitude;
  double longitude;
  String title;

  @override
  InfoPageState createState() => InfoPageState();
}

class InfoPageState extends State<ChargePointInfoPage> {
  String dropdownValue = 'cafe';
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchPlaces(dropdownValue),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: MainHeader(
                title: Text("reCharge"),
              ),
              body: Column(
                children: <Widget>[
                  DropdownButton<String>(
                      value: dropdownValue,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.deepPurple),
                      underline: Container(height: 2, color: Colors.deepPurple),
                      onChanged: (String newValue) {
                        setState(() => {dropdownValue = newValue});
                      },
                      items: <String>[
                        'cafe',
                        'museum',
                        'restaurant',
                        'atm',
                        'book_store',
                        'movie_theatre'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList()),
                  Expanded(
                    child: ListView(
                      children: createPlaceTileList(snapshot.data),
                    ),
                  ),
                ],
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
          title: Text(place.name),
          subtitle: Text(
              place.rating == null ? "no ratings" : "${place.rating} out of 5"),
          trailing: Image.network(place.icon)),
    );
    placeTileList.add(currentTile);
  });
  return placeTileList;
}
