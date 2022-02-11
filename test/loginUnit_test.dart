import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gigandjob_mobile_app/Dominio/Repositories/AuthRepository.dart';
import 'package:gigandjob_mobile_app/Dominio/Repositories/register_repository.dart';
import 'package:gigandjob_mobile_app/Dominio/Services/AuthService.dart';
import 'package:gigandjob_mobile_app/Dominio/Services/register_service.dart';
import 'package:gigandjob_mobile_app/Views/Login/BLOC/authbloc_bloc.dart';

import 'package:mocktail/mocktail.dart';

void main() {
  test('Login with a registered user', () async {
    final url = 'https://salvacion-git-job.herokuapp.com/auth/';

    final response = await AuthService(url: url).login(AuthEntity(
      email: 'jjj918@gmail.com',
      password: 'cjrubad3728',
    ));
    print('RESPONSE: $response');
    expect(response.statusCode, 201);
  });

  test('Login return 401 when password incorrect', () async {
    final url = 'https://salvacion-git-job.herokuapp.com/auth/';

    final response = await AuthService(url: url).login(AuthEntity(
      email: 'jjj918@gmail.com',
      password: '1234',
    ));
    print('RESPONSE: $response');
    expect(response.statusCode, 401);
  });
}
