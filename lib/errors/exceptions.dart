import 'package:dio/dio.dart';

import 'error_model.dart';

class ServerException implements Exception {
  final ErrorModel errModel;

  ServerException({required this.errModel});
}

void throwServerException(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerException(
          errModel: ErrorModel.fromJson(error.response!.data));
    case DioExceptionType.sendTimeout:
      throw ServerException(
          errModel: ErrorModel.fromJson(error.response!.data));
    case DioExceptionType.receiveTimeout:
      throw ServerException(
          errModel: ErrorModel.fromJson(error.response!.data));
    case DioExceptionType.badCertificate:
      throw ServerException(
          errModel: ErrorModel.fromJson(error.response!.data));
    case DioExceptionType.cancel:
      throw ServerException(
          errModel: ErrorModel.fromJson(error.response!.data));
    case DioExceptionType.connectionError:
      throw ServerException(
          errModel: ErrorModel.fromJson(error.response!.data));
    case DioExceptionType.unknown:
      throw ServerException(
          errModel: ErrorModel.fromJson(error.response!.data));
    case DioExceptionType.badResponse:
      switch (error.response!.statusCode) {
        case 400: // bad request
          throw ServerException(
              errModel: ErrorModel.fromJson(error.response!.data));
        case 401: // unauthorized
          throw ServerException(
              errModel: ErrorModel.fromJson(error.response!.data));
        case 403: // forbidden
          throw ServerException(
              errModel: ErrorModel.fromJson(error.response!.data));
        case 404: // not found
          throw ServerException(
              errModel: ErrorModel.fromJson(error.response!.data));
        case 409: // conflict
          throw ServerException(
              errModel: ErrorModel.fromJson(error.response!.data));
        case 422: // unprocessable entity
          throw ServerException(
              errModel: ErrorModel.fromJson(error.response!.data));
        case 504: // gateway timeout
          throw ServerException(
              errModel: ErrorModel.fromJson(error.response!.data));
      }
  }
}
