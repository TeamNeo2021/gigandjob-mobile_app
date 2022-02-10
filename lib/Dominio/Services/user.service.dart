import 'package:gigandjob_mobile_app/Dominio/Repositories/user.repsitory.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserService implements UserRepository {
  @override
  Future getUserByEmail(String email) async {
    var url = Uri.parse('http://');
    http.Response response = await http.get(url);
    return json.decode(response.body);
  }

  @override
  Future getCvByid(String id) async {
    var url = Uri.parse('http://');
    http.Response response = await http.get(url);
    return json.decode(response.body);
  }
}
