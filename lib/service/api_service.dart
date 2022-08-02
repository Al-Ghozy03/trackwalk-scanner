// ignore_for_file: unused_import, prefer_const_declarations, prefer_interpolation_to_compose_strings, prefer_final_fields

import 'dart:convert';
import 'package:alert/alert.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:track_walk_admin/models/api/event_model.dart';
import 'package:track_walk_admin/models/api/ticket_model.dart';
import 'getx_service.dart';

final storage = GetStorage();

class ApiService {
  String baseUrl = "https://track-dev.xplorin.id/wp-json/fooevents/v1";
  String _login = "/api/v1/token";
  String consumerKey = "ck_74c41e69516b18c05e84f8993331c49aca073c16";
  String consumerSecret = "cs_6d9b38145bd9cc8e55bb999d04a1a4ab0ceb450c";

  Future event() async {
    final res =
        await http.post(Uri.parse("$baseUrl/get_list_of_events"), headers: {
      "Content-Type": "application/x-www-form-urlencoded",
      "username": "tracktix",
      "password": "wYSLQ7jdN8k3(iO#6oyq7x9G",
    });
    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    } else {
      return false;
    }
  }

  Future ticket() async {
    final res = await http.get(Uri.parse(
        "$baseUrl/orders?consumer_key=$consumerKey&consumer_secret=$consumerSecret"));
    if (res.statusCode == 200) {
      return ticketModelFromJson(res.body);
    } else {
      return false;
    }
  }

  Future login(String username, String password) async {
    Uri urlApi = Uri.parse(baseUrl + "/$_login");
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    final response = await http.post(
      urlApi,
      body: jsonEncode({
        "username": username.toLowerCase(),
        "password": password,
      }),
      headers: requestHeaders,
    );
    if (response.statusCode == 400) {
      Alert(
              message: jsonDecode(response.body)["error_description"],
              shortDuration: true)
          .show();
      return false;
    }
    if (response.statusCode == 200) {
      storage.write("token", jsonDecode(response.body)["jwt_token"]);
      return true;
    } else {
      return false;
    }
  }
}
