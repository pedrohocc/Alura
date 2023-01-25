import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/http.dart';

import 'http_interceptors.dart';

class JournalService {
  static const String url = "http://192.168.15.102:3000/";
  static const String resource = "learnhttp/";

  http.Client client =
      InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  Uri getUrl() {
    return Uri.parse("$url$resource");
  }

  void register(String element) {
    client.post(
      getUrl(),
      body: {"teste": element},
    );
  }

  Future<String> get() async {
    http.Response response = await client.get(getUrl());
    return response.body;
  }
}
