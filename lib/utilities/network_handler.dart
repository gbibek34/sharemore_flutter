import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class NetworkHandler {
  String baseurl = "http://192.168.1.2:5000/api";
  var log = Logger();

  Future<dynamic> get(url) async {
    url = Uri.parse(formatter(url));
    var response = await http.get(url);
    var data = jsonDecode(response.body);
    // print(data["success"]);
    if (data["success"] == true) {
      // log.i(data);
      return data;
    } else {
      // log.i(data);
      return data;
    }
  }

  Future<dynamic> post(url, Map<String, String> body) async {
    url = Uri.parse(formatter(url));
    var response = await http.post(
      url,
      headers: {"Content-type": "application/json"},
      body: json.encode(body),
    );
    var data = jsonDecode(response.body);
    log.i(data['success']);
    if (data['success'] == true) {
      log.i(data);
      return data;
    } else {
      log.i(data);
      return data;
    }
  }

  String formatter(String url) {
    return baseurl + url;
  }
}

// /api/user/register