class UserDto {
  final String image;
  final String name;
  final String lastname;
  final String email;
  final String description;
  final List<String> works;
  final List<String> studies;

  const UserDto({
    required this.lastname,
    required this.image,
    required this.name,
    required this.email,
    required this.description,
    required this.works,
    required this.studies,
  });
}
