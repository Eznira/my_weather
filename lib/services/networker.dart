import 'package:http/http.dart' as http;
import 'location.dart';

// get location coordinates
Location location = Location();
final lat = location.lat;
final long = location.long;

// creates the api path for getting weatherdata
final String apiPath = 'hdhd$lat/djdj$long';

class Networker {
  var response;

  Networker() {
    _getResponse();
  }

  final Uri uri = Uri.directory(apiPath);

  void _getResponse() async {
    response = await http.get(uri);
  }
}
