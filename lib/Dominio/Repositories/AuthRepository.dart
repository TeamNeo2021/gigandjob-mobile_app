abstract class AuthRepository {
  Future login(AuthEntity authEntity);
  Future logout();
}

class AuthEntity {
  AuthEntity({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}
