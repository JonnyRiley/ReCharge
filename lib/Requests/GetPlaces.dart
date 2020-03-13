import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

// void main() {
//   fetchPlaces();
// }

Future<List<dynamic>> fetchPlaces() async {
  var uri =
      Uri.https('maps.googleapis.com', '/maps/api/place/nearbysearch/json', {
    "location": "53.483959,-2.244644",
    "radius": "500",
    "types": "cafe",
    "key": "AIzaSyB9HqRXH7PlvczMIg4LgUYBR4oxMI8M7fs"
  });
  final response = await http.get(uri);
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
  final dynamic photoRef;
  final double rating;

  const Place(
      this.latitude, this.longitude, this.name, this.rating, this.photoRef);

  Place.fromUnformatted(Map place)
      : latitude = place["geometry"]["location"]["lat"],
        longitude = place["geometry"]["location"]["lng"],
        name = place["name"],
        photoRef = place["photos"] != null
            ? place["photos"][0]["photo_reference"]
            : null,
        rating = place["rating"];
}
