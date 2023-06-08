import 'package:http/http.dart' as http;
import 'dart:convert';

import '../dtos/login_dto.dart';

class AuthApi {
  static Future<http.Response> login(LoginDto loginDto) async {
    return await http.post(Uri.parse('http://localhost:8080/api/v1/auth/login'),
        body: json.encode(loginDto.toMap()),
        headers: {'Content-Type': 'application/json'});
  }

  // static Future<http.Response> refresh(String refreshToken) async {
  //   return await http.post(
  //       Uri.parse('http://localhost:9999/api/v1/auth/refresh'),
  //       body: json.encode({'refreshToken': refreshToken}),
  //       headers: {'Content-Type': 'application/json'});
  // }
}