import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class NetworkHandler {
  String baseurl = "http://192.168.1.2:5000/api";
  var log = Logger();

  Future<dynamic> get(url) async {
    url = Uri.parse(formatter(url));
    var response = await http.get(url);
    log.i(response.body);
    // log.i(response.body);
  }

  Future<dynamic> post(url, Map<String, String> body) async {
    url = Uri.parse(formatter(url));
    var response = await http.post(url, body: body);
    var data = jsonDecode(response.body);
    if (data["success"] == 'true') {
      log.i(data);
      return response;
    }
    log.i(data["msg"]);
    log.i(data["success"]);
  }

  String formatter(String url) {
    return baseurl + url;
  }
}

// /api/user/register