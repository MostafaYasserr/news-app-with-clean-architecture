import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../errors/exceptions.dart';
import 'api_consumer.dart';
import 'end_points.dart';


class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = EndPoints.baserUrl;
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));

  }

//!POST
  @override
  Future post(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false}) async {
    try {
      dio.post(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

//!GET
  @override
  Future get(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      var res =
          await dio.get(path, data: data, queryParameters: queryParameters);
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

//!DELETE
  @override
  Future delete(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      var res = await dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

//!PATCH
  @override
  Future patch(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false}) async {
    try {
      var res = await dio.patch(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }
}
