import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigandjob_mobile_app/Dominio/Repositories/AuthRepository.dart';
import 'package:gigandjob_mobile_app/Views/Login/BLOC/authbloc_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AuthLoginResponse {
  final int statusCode;
  String? message;
  String? userId;
  String? jwt;
  String? userEmail;
  AuthLoginResponse(
      {this.userId = '',
      this.userEmail = '',
      this.jwt = '',
      required this.statusCode,
      this.message = ''});

  @override
  String toString() {
    return 'AuthLoginResponse: statusCode: $statusCode, message: $message, jwt: $jwt, userId: $userId,  userEmail: $userEmail';
  }
}

class AuthService implements AuthRepository {
  String url;

  AuthService({required this.url});

  @override
  Future logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<AuthLoginResponse> login(AuthEntity authEntity) async {
    final loginUrl = this.url + 'login';
    var client = http.Client();

    var userData = authEntity.email + ':' + authEntity.password;
    var response = await client.post(Uri.parse(loginUrl), body: {}, headers: {
      'Authorization': 'Basic ${base64.encode(utf8.encode(userData))}'
    });
    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    print('AuthService LOGIN:  statusCode: ${response.statusCode}');
    print('AuthService LOGIN:  response: $decodedResponse');

    if (response.statusCode == 200 || response.statusCode == 201) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('id', decodedResponse['id']);
      await prefs.setString('email', decodedResponse['email']);
      await prefs.setString('jwt', decodedResponse['jwt']);
    } else {
      //throw Exception('AuthService onLogin error response:  ${response} ');
      print('AuthService onLogin error response:  ${response} ');
    }

    print('AUTHSERVICE JWT RESPONSE ${decodedResponse['jwt']}');

    var result = new AuthLoginResponse(
      statusCode: response.statusCode,
      jwt: decodedResponse['jwt'],
      message: decodedResponse['message'],
      userId: decodedResponse['id'],
      userEmail: decodedResponse['email'],
    );

    print('AUTHSERVICE: LOGIN RESULT = $result');
    return result;
  }
}
