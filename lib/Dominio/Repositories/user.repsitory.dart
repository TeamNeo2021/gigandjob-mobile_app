abstract class UserRepository {
  Future getUserByEmail(String email);
  Future getCvByid(String id);
}
