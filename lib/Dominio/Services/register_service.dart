import 'package:gigandjob_mobile_app/Dominio/Repositories/register_repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterService implements RegisterRepository {
  @override
  Future signup(RegisterEntity registerEntity) async {
    final post = await http.post(
      Uri.parse('https://salvacion-git-job.herokuapp.com/Candidate'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, dynamic>{
        "name": {
          "firstname": registerEntity.name,
          "lastnames": registerEntity.lastname
        },
        "phone": {
          "areaCode": registerEntity.phone.split('-')[0],
          "phoneNumber": registerEntity.phone.split('-')[1]
        },
        "email": registerEntity.email,
        "birthdate": registerEntity.bday,
        "location": {
          "latitude": registerEntity.latitude,
          "longitude": registerEntity.longitud
        },
        "password": registerEntity.password
      }),
    );
    return post;
  }
}
