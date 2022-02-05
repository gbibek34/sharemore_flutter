import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class NetworkHandler {
  String baseurl = "http://10.0.2.2:5000/api/";
  var log = Logger();

  Future<dynamic> get(url) async {
    url = Uri.parse(formatter(url));
    var response = await http.get(url);
    log.i(response.body);
    // log.i(response.body);
  }

  String formatter(String url) {
    return baseurl + url;
  }
}

// /api/user/register