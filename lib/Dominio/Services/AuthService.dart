import 'package:gigandjob_mobile_app/Dominio/Repositories/AuthRepository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService implements AuthRepository {
  final url = 'http://localhost:3000/auth/login';

  @override
  Future logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future login(AuthEntity authEntity) async {
    var client = http.Client();
    try {
      var userData = authEntity.email + ':' + authEntity.password;
      var response = await client.post(Uri.parse(url), body: {}, headers: {
        'Authorization': 'Basic ${base64.encode(utf8.encode(userData))}'
      });
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      var uri = Uri.parse(decodedResponse['uri'] as String);
      print(await client.get(uri));
    } finally {
      client.close();
    }
  }
}
