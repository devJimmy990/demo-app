import 'package:dio/dio.dart';
import 'package:demo_app/model/dio_response.dart';

class Connection {
  static final Dio _dio = Dio();
  static Connection? _connectionInstance;

  Connection._();

  static Connection get instance => _connectionInstance ??= Connection._();

  Future<DioResponse> get({required String url}) async {
    try {
      final response = await _dio.get("https://dummyjson.com/users");
      return DioResponse.success(response.data["users"]);
    } on DioException catch (e) {
      if (e.response?.statusCode == 409) {
        return DioResponse.failure(
            'Conflict: The request conflicts with the server state.');
      }
      return DioResponse.failure(e.message ?? "DioException occurred");
    } catch (e) {
      return DioResponse.failure('An unexpected error occurred: $e');
    }
  }
}
