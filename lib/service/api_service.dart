// ignore_for_file: unused_import

import 'dart:convert';

import 'package:alert/alert.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'getx_service.dart';

final storage = GetStorage();

class ApiService {
  static final String _baseUrl = "https://track-dev.xplorin.id/wp-json";
  static final String _login = "/api/v1/token";

  Future login(String username, String password) async {
    Uri urlApi = Uri.parse(_baseUrl + "/$_login");
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
