import 'package:dio/dio.dart';
import 'network_interceptor.dart';

class DioClient {
  static Dio getDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://jsonplaceholder.typicode.com',
      ),
    );

    dio.interceptors.add(NetworkInterceptor());

    return dio;
  }
}
