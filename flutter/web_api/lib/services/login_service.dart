import 'dart:convert';
import 'dart:io';

import 'package:flutter_webapi_second_course/services/api.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'http_interceptors.dart';

class LoginService {
  static String url = API().urlAPI;

  http.Client client = InterceptedClient.build(
    interceptors: [LoggingInterceptor()],
  );

  Future<bool> login({required String email, required String senha}) async {
    http.Response response = await client.post(Uri.parse("${url}login"),
        body: {"email": email, "password": senha});

    if (response.statusCode != 200) {
      String content = json.decode(response.body);
      switch (content) {
        case "Cannot find user":
          throw CannotFindUser();
      }
      throw HttpException(content);
    }

    saveUserInfos(response.body);

    return true;
  }

  register({required String email, required String senha}) async {
    http.Response response = await client.post(Uri.parse("${url}register"),
        body: {"email": email, "password": senha});

    if (response != 201) {
      throw HttpException(response.body);
    }
    saveUserInfos(response.body);
  }

  saveUserInfos(String body) async {
    Map<String, dynamic> map = json.decode(body);

    String accessToken = map["accessToken"];
    String email = map["user"]["email"];
    int id = map["user"]["id"];

    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("acessToken", accessToken);
    prefs.setString("email", email);
    prefs.setInt("id", id);

    String? token2 = prefs.getString("acessToken");

    print(token2);
  }
}

class CannotFindUser implements Exception {}
