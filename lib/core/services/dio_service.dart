import 'package:dio/dio.dart';
import '../config/api_config.dart';

class DioService {
  static final DioService _instance = DioService._internal();
  late Dio dio;

  factory DioService() {
    return _instance;
  }

  DioService._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConfig.baseUrl,
        connectTimeout: const Duration(milliseconds: ApiConfig.connectTimeout),
        receiveTimeout: const Duration(milliseconds: ApiConfig.receiveTimeout),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );

    // Intercepteurs
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Ajouter le token si disponible
          // final token = await getToken();
          // if (token != null) {
          //   options.headers['Authorization'] = 'Bearer $token';
          // }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          return handler.next(e);
        },
      ),
    );
  }

  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.get(path, queryParameters: queryParameters);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(String path, {dynamic data}) async {
    try {
      final response = await dio.post(path, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> put(String path, {dynamic data}) async {
    try {
      final response = await dio.put(path, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete(String path) async {
    try {
      final response = await dio.delete(path);
      return response;
    } catch (e) {
      rethrow;
    }
  }
} 