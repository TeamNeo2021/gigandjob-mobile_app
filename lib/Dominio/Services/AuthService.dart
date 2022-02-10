import 'package:flutter/cupertino.dart';
import 'package:gigandjob_mobile_app/Dominio/Repositories/AuthRepository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService implements AuthRepository {
  String url;

  AuthService({required this.url});

  @override
  Future logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<bool> login(AuthEntity authEntity) async {
    final loginUrl = this.url + 'login';
    var client = http.Client();
    bool logged;
    try {
      var userData = authEntity.email + ':' + authEntity.password;
      var response = await client.post(Uri.parse(loginUrl), body: {}, headers: {
        'Authorization': 'Basic ${base64.encode(utf8.encode(userData))}'
      });
      print('LOGIN: Response $response');
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      print('LOGIN: Decoded response: $decodedResponse');

      logged = true;
    } catch (e) {
      logged = false;
      print('LOGIN: catch Error: $e');
    }
    // } finally {
    //   client.close();
    //   print('LOGIN close');
    // }
    print('LOGIN SUCCESFUL: $logged');
    return logged;
  }
}
