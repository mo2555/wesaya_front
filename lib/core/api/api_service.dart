import 'package:dio/dio.dart';
import 'package:wesaya/core/utils/end_points.dart';

import '../utils/enums.dart';
import 'api_call_model.dart';

class ApiService {
  static final BaseOptions _baseOptions = BaseOptions(
    responseType: ResponseType.json,
    connectTimeout: const Duration(
      seconds: 20,
    ),
    receiveTimeout: const Duration(
      seconds: 15,
    ),
  );
  final Dio _dio = Dio(
    _baseOptions,
  );

  ApiService() {
    _dio.options.baseUrl = EndPoints.baseUrl;
  }

  Future<dynamic> apiCall({
    required ApiCallModel model,
  }) async {
    _dio.options.headers = model.headers;
    _dio.options.headers.addAll({
      'Content-Type': 'application/json'
    });
    switch (model.type) {
      case ApiCallType.get:
        return await _get(
          endPoint: model.endPoint,
          body: model.body,
          query: model.query,
        );
      case ApiCallType.post:
        return await _post(
          endPoint: model.endPoint,
          body: model.body,
          query: model.query,
        );
      case ApiCallType.put:
        return await _put(
          endPoint: model.endPoint,
          body: model.body,
          query: model.query,
        );
      case ApiCallType.delete:
        return await _delete(
          endPoint: model.endPoint,
          body: model.body,
          query: model.query,
        );
    }
  }

  Future<dynamic> _get({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
  }) async {
    Response response = await _dio.get(
      endPoint,
      data: body,
      queryParameters: query,
    );
    return response.data;
  }

  Future<dynamic> _post({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
  }) async {
    Response response = await _dio.post(
      endPoint,
      data: body,
      queryParameters: query,
    );
    return response.data;
  }

  Future<dynamic> _put({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
  }) async {
    Response response = await _dio.put(
      endPoint,
      data: body,
      queryParameters: query,
    );
    return response.data;
  }

  Future<dynamic> _delete({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
  }) async {
    Response response = await _dio.delete(
      endPoint,
      data: body,
      queryParameters: query,
    );
    return response.data;
  }
}
