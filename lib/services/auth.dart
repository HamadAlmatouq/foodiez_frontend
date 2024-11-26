import 'package:dio/dio.dart';
import 'package:foodiez_frontend/models/user.dart';
import 'package:foodiez_frontend/services/client.dart';

class AuthServices {

  Future<String> signup({required User user}) async {
    late String token;
    try {
      // print('Signing up');
      // print(user.toJson());
      Response response =
          await Client.dio.post('/signup', data: user.toJson());
      token = response.data["token"];
      // print(response.data);
      return token;
    } on DioException catch (error) {
      print(error.response!.data["error"]["message"]);
      return error.response!.data["error"]["message"];
    }
  }

  Future<String> signin({required User user}) async {
    late String token;
    try {
      Response response =
          await Client.dio.post('/signin', data: user.toJson());
      token = response.data["token"];
      print(token);
    } on DioException catch (error) {
      print(error);
    }
    return token;
  }
}