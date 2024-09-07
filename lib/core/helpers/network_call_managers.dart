import 'package:dio/dio.dart';

import '../api/endpoints.dart';
import '../configs/storage_box.dart';
import 'shared_preference_manager.dart';

class ApiClient {
  ApiClient({Dio? dio})
      : _dio = dio ??
            Dio(
              BaseOptions(
                baseUrl: AppEndpoints.baseUrl,
                connectTimeout: const Duration(minutes: 1),
                headers: {
                  'Accept': 'application/json',
                  'Content-Type': 'application/json',
                 // 'Authorization': 'Bearer ${module.token}',
                },
              ),
            );
  final Dio _dio;

  Future<dynamic> get({required String url, required String token, Map<String, dynamic>? params, Map<String, dynamic>? data}) async {
    final String otpToken = SharedPreferencesManager.getString(PrefKeys.accessToken);
    try {
      final response = await _dio.get(
        url,
        queryParameters: params,
        data: data,
        options: Options(
          headers: {
            "Accept": "application/json",
          "Content-Type": "application/json",
          'Authorization': 'Bearer $otpToken',
          },
        ),
      );
      return response.data;
    } on FormatException {
      throw const FormatException('Bad response format 👎');
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> post(
     {
    required String url,
    required String token,
    Map<String, dynamic>? data,
    Map<String, dynamic>? params,
  }) async {
     final String otpToken = SharedPreferencesManager.getString(PrefKeys.accessToken);
     final String refreshToken = SharedPreferencesManager.getString(PrefKeys.refreshToken);
    try {
      final response = await _dio.post(
        url,
        data: data,
        queryParameters: params,
        options: Options(
          headers: {
            "Accept": "application/json",
          "Content-Type": "application/json",
          'Authorization': 'Bearer $otpToken',
          "X-Authorization": "Bearer $refreshToken"
          },
        ),
      );
      return response.data;
    } on FormatException {
      throw const FormatException('Bad response format 👎');
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic>authPost(
     {required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? params,
  }) async {
    try {
      final response = await _dio.post(
        url,
        data: data,
        queryParameters: params,
        options: Options(
          headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          },
        ),
      );
      return response.data;
    } on FormatException {
      throw const FormatException('Bad response format 👎');
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> patch(String url, {required String token,Map<String, dynamic>? data}) async {
    try {
      final String otpToken = SharedPreferencesManager.getString(PrefKeys.accessToken);
      final String refreshToken = SharedPreferencesManager.getString(PrefKeys.refreshToken);
      final response = await _dio.patch(
        url,
        data: data,
        options: Options(
          headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          'Authorization': 'Bearer $otpToken',
          "X-Authorization": "Bearer $refreshToken"
          },
        ),
      );
      return response.data;
    } on FormatException {
      throw const FormatException('Bad response format 👎');
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> put({required String url,required String token, Map<String, dynamic>? data}) async {
    try {
      final String otpToken = SharedPreferencesManager.getString(PrefKeys.accessToken);
      final String refreshToken = SharedPreferencesManager.getString(PrefKeys.refreshToken);
      final response = await _dio.put(
        url,
        data: data,
        options: Options(
          headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          'Authorization': 'Bearer $otpToken',
          "X-Authorization": "Bearer $refreshToken"
          },
        ),
      );
      return response.data;
    } on FormatException {
      throw const FormatException('Bad response format 👎');
    } catch (e) {
      rethrow;
    }
  }

  // Future<dynamic> putImage({
  //   required String url,
  //   required Map<String, dynamic>? query,
  //   required XFile image,
  // }) async {
  //   try {
  //     final img = await image.readAsBytes();
  //     final cntlength = await image.length();
  //     final mime = lookupMimeType(image.path);
  //     final response = await _dio.put(
  //       url,
  //       queryParameters: query,
  //       data: Stream.fromIterable(img.map((e) => [e])),
  //       options: Options(
  //         contentType: mime,
  //         headers: {
  //           'Content-Length': cntlength.toString(),
  //           'Connection': 'keep-alive',
  //           'Accept': '/',
  //         },
  //       ),
  //     );
  //     return response.data;
  //   } on FormatException {
  //     throw const FormatException('Bad response format 👎');
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future<dynamic> delete({required String url,required String token, Map<String, dynamic>? data}) async {
    final String otpToken = SharedPreferencesManager.getString(PrefKeys.accessToken);
    final String refreshToken = SharedPreferencesManager.getString(PrefKeys.refreshToken);
    try {
      final response = await _dio.delete(
        url,
        data: data,
        options: Options(
          headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          'Authorization': 'Bearer $otpToken',
          "X-Authorization": "Bearer $refreshToken"
          },
        ),
      );
      return response.data;
    } on FormatException {
      throw const FormatException('Bad response format 👎');
    } catch (e) {
      rethrow;
    }
  }
}

class ThimPressApiClient {
  ThimPressApiClient({Dio? dio})
      : _dio = dio ??
            Dio(
              BaseOptions(
                baseUrl: AppEndpoints.thimPressBaseUrl,
                connectTimeout: const Duration(minutes: 1),
                headers: {
                  'Accept': 'application/json',
                  'Content-Type': 'application/json',
                 // 'Authorization': 'Bearer ${module.token}',
                },
              ),
            );
  final Dio _dio;

  Future<dynamic> get({required String url, required String token, Map<String, dynamic>? params, Map<String, dynamic>? data}) async {
    final String otpToken = SharedPreferencesManager.getString(PrefKeys.accessToken);
    try {
      final response = await _dio.get(
        url,
        queryParameters: params,
        data: data,
        options: Options(
          headers: {
            "Accept": "application/json",
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token',
          },
        ),
      );
      return response.data;
    } on FormatException {
      throw const FormatException('Bad response format 👎');
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> post(
     {
    required String url,
    required String token,
    Map<String, dynamic>? data,
    Map<String, dynamic>? params,
  }) async {
     final String otpToken = SharedPreferencesManager.getString(PrefKeys.accessToken);
     final String refreshToken = SharedPreferencesManager.getString(PrefKeys.refreshToken);
    try {
      final response = await _dio.post(
        url,
        data: data,
        queryParameters: params,
        options: Options(
          headers: {
            "Accept": "application/json",
          "Content-Type": "application/json",
          'Authorization': 'Bearer $otpToken',
          "X-Authorization": "Bearer $refreshToken"
          },
        ),
      );
      return response.data;
    } on FormatException {
      throw const FormatException('Bad response format 👎');
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic>authPost(
     {required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? params,
  }) async {
    try {
      final response = await _dio.post(
        url,
        data: data,
        queryParameters: params,
        options: Options(
          headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          },
        ),
      );
      return response.data;
    } on FormatException {
      throw const FormatException('Bad response format 👎');
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> patch(String url, {required String token,Map<String, dynamic>? data}) async {
    try {
      final String otpToken = SharedPreferencesManager.getString(PrefKeys.accessToken);
      final String refreshToken = SharedPreferencesManager.getString(PrefKeys.refreshToken);
      final response = await _dio.patch(
        url,
        data: data,
        options: Options(
          headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          'Authorization': 'Bearer $otpToken',
          "X-Authorization": "Bearer $refreshToken"
          },
        ),
      );
      return response.data;
    } on FormatException {
      throw const FormatException('Bad response format 👎');
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> put({required String url,required String token, Map<String, dynamic>? data}) async {
    try {
      final String otpToken = SharedPreferencesManager.getString(PrefKeys.accessToken);
      final String refreshToken = SharedPreferencesManager.getString(PrefKeys.refreshToken);
      final response = await _dio.put(
        url,
        data: data,
        options: Options(
          headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          'Authorization': 'Bearer $otpToken',
          "X-Authorization": "Bearer $refreshToken"
          },
        ),
      );
      return response.data;
    } on FormatException {
      throw const FormatException('Bad response format 👎');
    } catch (e) {
      rethrow;
    }
  }

  // Future<dynamic> putImage({
  //   required String url,
  //   required Map<String, dynamic>? query,
  //   required XFile image,
  // }) async {
  //   try {
  //     final img = await image.readAsBytes();
  //     final cntlength = await image.length();
  //     final mime = lookupMimeType(image.path);
  //     final response = await _dio.put(
  //       url,
  //       queryParameters: query,
  //       data: Stream.fromIterable(img.map((e) => [e])),
  //       options: Options(
  //         contentType: mime,
  //         headers: {
  //           'Content-Length': cntlength.toString(),
  //           'Connection': 'keep-alive',
  //           'Accept': '/',
  //         },
  //       ),
  //     );
  //     return response.data;
  //   } on FormatException {
  //     throw const FormatException('Bad response format 👎');
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future<dynamic> delete({required String url,required String token, Map<String, dynamic>? data}) async {
    final String otpToken = SharedPreferencesManager.getString(PrefKeys.accessToken);
    final String refreshToken = SharedPreferencesManager.getString(PrefKeys.refreshToken);
    try {
      final response = await _dio.delete(
        url,
        data: data,
        options: Options(
          headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          'Authorization': 'Bearer $otpToken',
          "X-Authorization": "Bearer $refreshToken"
          },
        ),
      );
      return response.data;
    } on FormatException {
      throw const FormatException('Bad response format 👎');
    } catch (e) {
      rethrow;
    }
  }
}