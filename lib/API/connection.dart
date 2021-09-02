import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'connection_laravel.dart';
class connection {
  static String protocol() {
    String type = "http://";
    return type;
  }

  static String ip() {
    String address = "192.168.43.136";
    return address;
  }

  static String port() {
    return ':5000';
  }

  static String address() {
    return "/get";
  }

  static String send_messsage_URL(String message) {
    String url = protocol() + ip() + port() + address() + '?msg=' + message; //http://192.168.1.6:8000/api/register http://127.0.0.1:5000/get?msg=hi
    return url;
  }
  static Future sendMessageToAcademic(message) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("token");
    dynamic Response = await http.post(connection_laravel.sendMessageToAcademic(),
        headers: {
          'Authorization': 'Bearer $token',
        },
        body:{
          "message":message
        }
    );
    print(Response.statusCode);
    if (Response.statusCode == 200) {
      var jsonObject = json.decode(Response.body);
      if (jsonObject["token"] != null) {
        token = jsonObject["token"];
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString("token", token);
        final String t = pref.getString("token");
      }
    }
  }


  //cler;
  static Future sendMessageToClerk(message) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("token");
    dynamic Response = await http.post(connection_laravel.sendMessageToClerk(),
        headers: {
          'Authorization': 'Bearer $token',
        },
        body:{
          "message":message
        }
    );
    print(Response.statusCode);
    if (Response.statusCode == 200) {
      var jsonObject = json.decode(Response.body);
      if (jsonObject["token"] != null) {
        token = jsonObject["token"];
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString("token", token);
        final String t = pref.getString("token");
      }
    }
  }

}



