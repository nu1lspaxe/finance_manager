import 'dart:convert';
import 'package:finance_manager/utils/dio.dart';
import 'package:finance_manager/utils/utils.dart';

class AuthService {
  final String _baseURL;

  AuthService() : _baseURL = Utils.loadEnv('SERVER_USERS_URL');

  Future<Map<String, dynamic>> signIn(String email, String password) async {
    try {
      final dioClient = await DioClient().getDio();

      final response = await dioClient.post(
        '$_baseURL/signin',
        data: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;

        final String token = data['token'] as String? ?? '';

        if (token.isEmpty) {
          throw Exception('Token is empty');
        }

        return {
          'userId': data['userId'],
          'token': token,
        };

      } else {
        throw Exception('@lib/data/services/auth_service.dart - Failed to sign in: ${response.statusCode}');
      }
    
    } catch (e) {
      throw Exception('@lib/data/services/auth_service.dart - Error signing in: $e');
    }
  }

    Future<Map<String, dynamic>> signUp(String username, String email, String password) async {
    try {
      final dioClient = await DioClient().getDio();

      final response = await dioClient.post(
        '$_baseURL/signup',
        data: jsonEncode({
          'username': username,
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;

        final String token = data['token'] as String? ?? '';

        if (token.isEmpty) {
          throw Exception('Token is empty');
        }

        return {
          'userId': data['userId'],
          'token': token,
        };

      } else {
        throw Exception('@lib/data/services/auth_service.dart - Failed to sign in: ${response.statusCode}');
      }
    
    } catch (e) {
      throw Exception('@lib/data/services/auth_service.dart - Error signing in: $e');
    }
  }
}