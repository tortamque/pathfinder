import 'package:dio/dio.dart';

class SwaggerRepository {
  SwaggerRepository({
    required Dio client,
  }) : _client = client;

  final Dio _client;

  void test() async {
    final response = await _client.get(
      'flutter/api',
    );
    print('flutter/api');
    print(response.statusCode);
  }
}
