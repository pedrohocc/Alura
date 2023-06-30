import 'dart:convert';
import 'package:flutter_webapi_second_course/services/api.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/http.dart';
import '../models/journal.dart';
import 'http_interceptors.dart';

class JournalService {
  static String url = API().urlAPI;
  static const String resource = "journals/";

  http.Client client = InterceptedClient.build(
    interceptors: [LoggingInterceptor()],
  );

  String getURL() {
    return "$url$resource";
  }

  Uri getUri() {
    return Uri.parse(getURL());
  }

  Future<bool> register(Journal journal) async {
    String journalJSON = json.encode(journal.toMap());

    http.Response response = await client.post(
      getUri(),
      headers: {'Content-type': 'application/json'},
      body: journalJSON,
    );

    if (response.statusCode == 201) {
      return true;
    }

    return false;
  }

  Future<bool> edit(String id, Journal journal) async {
    String journalJSON = json.encode(journal.toMap());

    http.Response response = await client.put(
      Uri.parse("${getURL()}$id"),
      headers: {'Content-type': 'application/json'},
      body: journalJSON,
    );

    if (response.statusCode != 200) {
      return false;
    } else {
      return true;
    }
  }

  Future<List<Journal>> getAll() async {
    http.Response response = await client.get(getUri());

    if (response.statusCode != 200) {
      throw Exception();
    }

    List<Journal> result = [];

    List<dynamic> jsonList = json.decode(response.body);
    for (var jsonMap in jsonList) {
      result.add(Journal.fromMap(jsonMap));
    }

    return result;
  }

  Future<bool> delete(String idJournal) async {
    http.Response response =
        await client.delete(Uri.parse('${getURL()}$idJournal'));

    if (response.statusCode != 200) {
      return false;
    } else {
      return true;
    }
  }
}
