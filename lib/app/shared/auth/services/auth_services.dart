import 'package:dio/dio.dart';
import 'package:explained_full/app/pages/auth/models/user.dart';
import 'package:explained_full/app/shared/api/api_client.dart';

class AuthServices {
  Future<String> register({required User user}) async {
    late String token;
    try {
      Response response = await Client.dio.post('/signup', data: user.toJson());

      token = response.data["token"];
    } catch (error) {
      throw error.toString();
    }
    return token;
  }

  Future<String> login({required User user}) async {
    late String token;
    try {
      Response response = await Client.dio.post('/signin', data: user.toJson());
      token = response.data["token"];
    } catch (error) {
      throw error.toString();
    }
    return token;
  }
}
