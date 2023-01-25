import 'package:http_interceptor/http_interceptor.dart';
import 'package:logger/logger.dart';

class LoggingInterceptor implements InterceptorContract {
  Logger logger = Logger();

  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    logger.v(
        'Request for: ${data.baseUrl}\nHeaders: ${data.headers}\nBody: ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    if (data.statusCode ~/ 100 == 2) {
      logger.i(
          'Response of: ${data.url}\nHeaders: ${data.headers}\nBody: ${data.body}\nStatus code: ${data.statusCode}');
    } else {
      logger.e(
          'Response of: ${data.url}\nHeaders: ${data.headers}\nBody: ${data.body}\nStatus code: ${data.statusCode}');
    }
    return data;
  }
}
