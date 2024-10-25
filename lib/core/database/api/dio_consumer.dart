// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter_dealing_with_api/core/database/api/api_consumer.dart';
import 'package:flutter_dealing_with_api/core/database/api/api_interceptors.dart';
import 'package:flutter_dealing_with_api/core/database/api/end_points.dart';
import 'package:flutter_dealing_with_api/errors/exceptions.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer(this.dio) {
    dio.options.baseUrl = EndPoints.baseUrl;
    dio.interceptors.add(ApiInterceptors());
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      requestBody: true,
      error: true,
    ));
  }

  @override
  Future delete(String path,
      {dynamic bodayData,
      Map<String, String>? queryParameters,
      bool isFromData = false}) async {
    try {
      final response = await dio.delete(
        path,
        data: isFromData ? FormData.fromMap(bodayData) : bodayData,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      throwServerException(e);
    }
  }

  @override
  Future get(String path,
      {Object? bodayData, Map<String, String>? queryParameters}) async {
    try {
      final response = await dio.get(
        path,
        data: bodayData,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      throwServerException(e);
    }
  }

  @override
  Future patch(String path,
      {dynamic bodayData,
      Map<String, String>? queryParameters,
      bool isFromData = true}) async {
    try {
      final response = await dio.patch(
        path,
        data: isFromData ? FormData.fromMap(bodayData) : bodayData,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      throwServerException(e);
    }
  }

  @override
  Future post(String path,
      {dynamic bodayData,
      Map<String, String>? queryParameters,
      bool isFromData = false}) async {
    try {
      final response = await dio.post(
        path,
        data: isFromData ? FormData.fromMap(bodayData) : bodayData,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      throwServerException(e);
    }
  }
}
