import 'package:dio/dio.dart';

class AppException implements Exception {
  const AppException({
    required this.message,
    this.code,
    this.originalException,
    this.stackTrace,
  });

  factory AppException.fromNetworkException(DioException exception) {
    String message;
    String? code;

    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        message = 'Connection timed out';
        code = 'TIMEOUT';
      case DioExceptionType.badCertificate:
        message = 'Bad certificate';
        code = 'BAD_CERTIFICATE';
      case DioExceptionType.badResponse:
        final statusCode = exception.response?.statusCode;
        message = 'Bad response: ${statusCode ?? 'Unknown status'}';
        code = 'BAD_RESPONSE_$statusCode';
      case DioExceptionType.cancel:
        message = 'Request cancelled';
        code = 'CANCELLED';
      case DioExceptionType.connectionError:
        message = 'Connection error';
        code = 'CONNECTION_ERROR';
      case DioExceptionType.unknown:
        message = 'Network error: ${exception.message ?? 'Unknown'}';
        code = 'UNKNOWN';
    }

    return AppException(
      message: message,
      code: code,
      originalException: exception,
      stackTrace: exception.stackTrace,
    );
  }
  final String message;
  final String? code;
  final dynamic originalException;
  final StackTrace? stackTrace;

  static const unknown = AppException(message: 'Unknown error');

  @override
  String toString() => 'AppException(message: $message, code: $code)';
}
