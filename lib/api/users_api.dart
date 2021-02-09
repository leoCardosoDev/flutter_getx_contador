import 'package:dio/dio.dart';
import 'package:flutter_getx_esp_contador/models/users.dart';

class UsersAPI {
  UsersAPI._internal();
  static UsersAPI _instance = UsersAPI._internal();
  static UsersAPI get instance => _instance;

  final Dio _dio = Dio();

  Future<List<User>> getUsers(int page) async {
    try {
      final Response response = await this._dio.get(
          'https://reqres.in/api/users',
          queryParameters: {"page": page, "delay": 5});

      return (response.data['data'] as List)
          .map((users) => User.fromJson(users))
          .toList();
    } catch (e) {
      print(e);
      return null;
    }
  }
}
