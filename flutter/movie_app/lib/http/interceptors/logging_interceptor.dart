// ignore_for_file: avoid_print

import 'package:http_interceptor/http/http.dart';
import 'package:http_interceptor/models/request_data.dart';
import 'package:http_interceptor/models/response_data.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    print('REQUEST');
    print('URL: ${data.baseUrl}');
    print('HEADERS: ${data.headers}');
    print('BODY: ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    print('RESPONSE');
    print('STATUS CODE: ${data.statusCode}');
    print('HEADERS: ${data.headers}');
    print('BODY: ${data.body}');
    return data;
  }
}
