import 'package:dio/dio.dart';

class DioUtils {
  static BaseOptions getBaseOptions() {
    return BaseOptions(
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {
        'Authorization':
            'Bearer O7Kw5E2embxod5YtL1h1YsGNN7FFN8wIxPYMg6J9zFjE6Th9oDssEsFLVhxf',
      },
    );
  }
}
