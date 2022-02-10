abstract class RegisterRepository {
  Future signup(RegisterEntity registerEntity);
}

class RegisterEntity {
  RegisterEntity({
    required this.name,
    required this.lastname,
    required this.phone,
    required this.bday,
    required this.longitud,
    required this.latitude,
    required this.email,
    required this.password,
  });

  final String name;
  final String lastname;
  final String phone;
  final String bday;
  final String longitud;
  final String latitude;
  final String email;
  final String password;
}
