import 'package:http/http.dart';
import 'package:http_interceptor/http/http.dart';
import 'package:movie_app/http/interceptors/logging_interceptor.dart';

final Client client = InterceptedClient.build(
  interceptors: [LoggingInterceptor()],
);
