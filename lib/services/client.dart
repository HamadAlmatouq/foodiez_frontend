import 'package:dio/dio.dart';

class Client {
  static final Dio dio = Dio(BaseOptions(baseUrl: 'http://localhost:8000'));  //'https://coded-pets-api-auth.eapi.joincoded.com';
}