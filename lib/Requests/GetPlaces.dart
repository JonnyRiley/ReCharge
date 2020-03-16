import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<List<dynamic>> fetchPlaces(String placeType) async {
  var uri =
      Uri.https('maps.googleapis.com', '/maps/api/place/nearbysearch/json', {
    "location": "53.483959,-2.244644",
    "radius": "500",
    "type": placeType,
    // "rankby": "distance",
    "key": "AIzaSyB9HqRXH7PlvczMIg4LgUYBR4oxMI8M7fs"
  });
  final response = await http.get(uri);
  print(response.body);
  if (response.statusCode == 200) {
    var listOfPlaces = jsonDecode(response.body)['results'];
    var listOfPlaceObjects =
        listOfPlaces.map((place) => Place.fromUnformatted(place)).toList();
    return listOfPlaceObjects;
  } else {
    return null;
  }
}

class Place {
  final double latitude;
  final double longitude;
  final String name;
  final String icon;
  final num rating;

  const Place(this.latitude, this.longitude, this.name, this.rating, this.icon);

  Place.fromUnformatted(Map place)
      : latitude = place["geometry"]["location"]["lat"],
        longitude = place["geometry"]["location"]["lng"],
        name = place["name"],
        icon = place["icon"],
        rating = place["rating"];
}
