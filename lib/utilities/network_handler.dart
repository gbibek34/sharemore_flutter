import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:sharemore/utilities/token_storage.dart';

class NetworkHandler {
  String baseurl = "http://10.1.1.87:5000/api";
  var log = Logger();

  Future<dynamic> get(url) async {
    var token = await loadToken();
    url = Uri.parse(formatter(url));
    var response =
        await http.get(url, headers: {"authorization": "Bearer " + token!});
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
    var token = await loadToken();
    url = Uri.parse(formatter(url));
    var response = await http.post(
      url,
      headers: {
        "Content-type": "application/json",
        "authorization": "Bearer " + token!
      },
      body: json.encode(body),
    );
    var data = jsonDecode(response.body);
    log.i(data['success']);
    if (data['success'] == true) {
      // log.i(data);
      return data;
    } else {
      // log.i(data);
      return data;
    }
  }

  Future<dynamic> put(url, Map<String, String> body) async {
    var token = await loadToken();
    url = Uri.parse(formatter(url));
    var response = await http.put(
      url,
      headers: {
        "Content-type": "application/json",
        "authorization": "Bearer " + token!
      },
      body: json.encode(body),
    );
    var data = jsonDecode(response.body);
    log.i(data['success']);
    if (data['success'] == true) {
      // log.i(data);
      return data;
    } else {
      // log.i(data);
      return data;
    }
  }

  Future<dynamic> delete(url) async {
    var token = await loadToken();
    url = Uri.parse(formatter(url));
    var response = await http.delete(
      url,
      headers: {
        "Content-type": "application/json",
        "authorization": "Bearer " + token!
      },
    );
    var data = jsonDecode(response.body);
    log.i(data['success']);
    if (data['success'] == true) {
      // log.i(data);
      return data;
    } else {
      // log.i(data);
      return data;
    }
  }

  String formatter(String url) {
    return baseurl + url;
  }
}
