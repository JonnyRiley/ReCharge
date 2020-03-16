import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import '../Requests/openCharge_request.dart';
import './Form.dart';
import './UserHomePage.dart';

class UserHomeMapPage extends StatefulWidget {
  @override
  UserHomeMapPageState createState() => UserHomeMapPageState();
}

class UserHomeMapPageState extends State<UserHomeMapPage> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
  }

  double zoomVal = 5.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Route Planner"),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text('Home'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UserHomePage()));
                },
              ),
              ListTile(
                title: Text('Plan route'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RouteForm()));
                },
              )
            ],
          ),
        ),
        //   leading: IconButton(
        //       icon: Icon(FontAwesomeIcons.arrowLeft),
        //       onPressed: () {
        //         //
        //       }),
        //   title: Text("New York"),
        //   actions: <Widget>[
        //     IconButton(
        //         icon: Icon(FontAwesomeIcons.search),
        //         onPressed: () {
        //           //
        //         }),
        //   ],
        // ),
        body: FutureBuilder(
          future: fetchChargePoints(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Stack(
                children: <Widget>[
                  _buildGoogleMap(context, snapshot.data),
                  _zoomminusfunction(),
                  _zoomplusfunction(),
                  _buildContainer(snapshot.data),
                ],
              );
            } else {
              return Text('loading...');
            }
          },
        ));
  }

  Widget _zoomminusfunction() {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
          icon: Icon(FontAwesomeIcons.searchMinus, color: Color(0xff6200ee)),
          onPressed: () {
            zoomVal--;
            _minus(zoomVal);
          }),
    );
  }

  Widget _zoomplusfunction() {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
          icon: Icon(FontAwesomeIcons.searchPlus, color: Color(0xff6200ee)),
          onPressed: () {
            zoomVal++;
            _plus(zoomVal);
          }),
    );
  }

  Future<void> _minus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(53.483959, -2.244644), zoom: zoomVal)));
  }

  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(53.483959, -2.244644), zoom: zoomVal)));
  }

  Widget _buildContainer(List chargePointList) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 150.0,
        child: ListView(
            scrollDirection: Axis.horizontal,
            children: makeListOfBoxes(chargePointList)
            //       <Widget>[
            //   SizedBox(width: 10.0),
            //   Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child:
            //     _boxes()
            //   ),
            // ],
            ),
      ),
    );
  }

  List<Widget> makeListOfBoxes(chargePointList) {
    List<Widget> listOfBoxes = [];
    chargePointList.forEach((chargePoint) => {
          listOfBoxes.add(
            _boxes(chargePoint.latitude, chargePoint.longitude,
                'Jonnys Lovely station'),
          )
        });
    return listOfBoxes;
  }

  Widget _boxes(double lat, double long, String chargeStationName,
      [String _image]) {
    return GestureDetector(
      onTap: () {
        _gotoLocation(lat, long);
      },
      child: Container(
        child: new FittedBox(
          child: Material(
              color: Colors.white,
              elevation: 14.0,
              borderRadius: BorderRadius.circular(24.0),
              shadowColor: Color(0x802196F3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 180,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(24.0),
                      // child: Image(
                      //   fit: BoxFit.fill,
                      //   image: NetworkImage(_image),
                      // ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: myDetailsContainer1(chargeStationName),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Widget myDetailsContainer1(String chargeStationName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(
            chargeStationName,
            style: TextStyle(
                color: Color(0xff6200ee),
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          )),
        ),
        SizedBox(height: 5.0),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
                child: Text(
              "4.1",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18.0,
              ),
            )),
            Container(
              child: Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
              child: Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
              child: Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
              child: Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
              child: Icon(
                FontAwesomeIcons.solidStarHalf,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
                child: Text(
              "(946)",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18.0,
              ),
            )),
          ],
        )),
        SizedBox(height: 5.0),
        Container(
            child: Text(
          "American \u00B7 \u0024\u0024 \u00B7 1.6 mi",
          style: TextStyle(
            color: Colors.black54,
            fontSize: 18.0,
          ),
        )),
        SizedBox(height: 5.0),
        Container(
            child: Text(
          "Closed \u00B7 Opens 17:00 Thu",
          style: TextStyle(
              color: Colors.black54,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        )),
      ],
    );
  }

  Widget _buildGoogleMap(BuildContext context, List chargePointList) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition:
              CameraPosition(target: LatLng(53.483959, -2.244644), zoom: 12),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          markers: makeMarkerSet(chargePointList),
        ));
  }

  Set<Marker> makeMarkerSet(chargePointList) {
    Set<Marker> markers = Set();
    Marker resultMarker;
    chargePointList.forEach((chargePoint) => {
          resultMarker = new Marker(
              markerId:
                  MarkerId('${chargePoint.latitude} ${chargePoint.longitude}'),
              position: LatLng(chargePoint.latitude, chargePoint.longitude)),
          markers.add(resultMarker)
        });
    return markers;
  }

  Future<void> _gotoLocation(double lat, double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(lat, long),
      zoom: 15,
      tilt: 50.0,
      bearing: 45.0,
    )));
  }
}

// Marker gramercyMarker = Marker(
//   markerId: MarkerId('gramercy'),
//   position: LatLng(40.738380, -73.988426),
//   infoWindow: InfoWindow(title: 'Gramercy Tavern'),
//   icon: BitmapDescriptor.defaultMarkerWithHue(
//     BitmapDescriptor.hueViolet,
//   ),
// );
