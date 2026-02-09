import 'dart:math';
import 'package:dio/dio.dart';

class NetworkInterceptor extends Interceptor {
  final Random _random = Random();

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {

    // Delay aleatorio
    final delay = _random.nextInt(4) + 1;
    await Future.delayed(Duration(seconds: delay));

    // 20% de probabilidad de error
    final shouldFail = _random.nextInt(100) < 20;

    if (shouldFail) {
      final statusCode = _random.nextBool() ? 401 : 500;

      return handler.reject(
        DioException(
          requestOptions: options,
          response: Response(
            requestOptions: options,
            statusCode: statusCode,
          ),
          type: DioExceptionType.badResponse,
        ),
      );
    }

    return handler.next(options);
  }
}
