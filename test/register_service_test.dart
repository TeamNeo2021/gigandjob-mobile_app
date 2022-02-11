import 'dart:math';
import 'package:flutter_test/flutter_test.dart';
import 'package:gigandjob_mobile_app/Dominio/Repositories/register_repository.dart';
import 'package:gigandjob_mobile_app/Dominio/Services/register_service.dart';

void main() {
  test('RegisterService send to backend new user', () async {
    Random random = Random();
    int randomNumber = random.nextInt(100);

    final response = await RegisterService().signup(RegisterEntity(
        email: 'test' + randomNumber.toString() + '@test.com',
        password: '12345678ABcv',
        bday: '12-12-1991',
        lastname: 'test',
        latitude: '10.4886',
        longitud: '-66.8948',
        name: 'test',
        phone: '0412-9998866'));

    expect(response.statusCode, 201);
  });
}
