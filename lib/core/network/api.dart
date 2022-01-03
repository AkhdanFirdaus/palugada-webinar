import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../constants/api_constants.dart';

export '../constants/api_constants.dart';

final apiProvider = Provider<Dio>((ref) {
  final Dio httpClient = Dio()
    ..options.baseUrl = ApiConstants.baseUrl
    ..interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));
  return httpClient;
});

class ErrorMessage implements Exception {
  ErrorMessage(this.message);
  final String message;

  @override
  String toString() {
    return message;
  }
}
