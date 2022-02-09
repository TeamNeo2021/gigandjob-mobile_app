import 'package:gigandjob_mobile_app/Dominio/Repositories/register_repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterService implements RegisterRepository {
  final url = 'http://localhost:3000/register';

  @override
  Future signup(RegisterEntity registerEntity) async {
    var client = http.Client();
    try {
      var userData = registerEntity.email +
          ':' +
          registerEntity.password +
          ':' +
          registerEntity.name +
          ':' +
          registerEntity.lastname +
          ':' +
          registerEntity.phone +
          ':' +
          registerEntity.latitude +
          ':' +
          registerEntity.longitud +
          ':' +
          registerEntity.bday;
      var response = await client.post(Uri.parse(url), body: {}, headers: {
        'Authorization': 'Basic ${base64.encode(utf8.encode(userData))}'
      });
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      var uri = Uri.parse(decodedResponse['uri'] as String);
      // ignore: avoid_print
      print(await client.get(uri));
    } finally {
      client.close();
    }
  }
}
