import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:foodiez_frontend/models/user.dart';
import 'package:foodiez_frontend/services/client.dart';

class AuthServices {
  get http => null;

  Future<String> signup({required User user}) async {
    late String token;
    try {
      // print('Signing up');
      // print(user.toJson());
      Response response = await Client.dio.post('/signup', data: user.toJson());
      token = response.data["token"];
      // print(response.data);
      return token;
    } on DioException catch (error) {
      print(error.response!.data["error"]["message"]);
      return error.response!.data["error"]["message"];
    }
  }

//   Future<String> signin({required User user}) async {
//     late String token;
//     try {
//       Response response = await Client.dio.post('/signin', data: user.toJson());
//       token = response.data["token"];
//       print(token);
//     } on DioException catch (error) {
//       print(error);
//     }
//     return token;
//   }
// }
  Future<String> signin({required User user}) async {
    final response = await http.post(
      Uri.parse('http://localhost:8000/api/users/signin'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'username': user.username,
        'password': user.password,
      }),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['token'];
    } else {
      throw Exception('Failed to sign in');
    }
  }
}
