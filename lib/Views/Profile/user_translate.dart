// ignore_for_file: dead_code

import 'package:gigandjob_mobile_app/Dominio/Models/user.dto.dart';
import 'package:gigandjob_mobile_app/Dominio/Services/user.service.dart';

class UserTranslate {
  final UserDto userTest = const UserDto(
    name: 'Carlos',
    lastname: 'Valero',
    image:
        "https://img2.freepng.es/20180420/aie/kisspng-computer-icons-silhouette-user-profile-5ada934a8f5461.2830952615242739945871.jpg",
    email: 'onvalero@gmail.com',
    description: 'Ingeniero informatico',
    studies: ['Ingeniero informatico', 'Master en Oracle'],
    works: ['Oracle', 'Google', 'Cuevana3.io'],
  );

  UserDto translate(email) {
    return userTest;
    dynamic candidate = UserService().getUserByEmail(email);
    dynamic cv = UserService().getCvByid(candidate.id);
    return UserDto(
        name: candidate.name,
        lastname: candidate.lastname,
        email: candidate.email,
        image: cv.image,
        description: cv.about,
        studies: cv.studies,
        works: cv.works);
  }
}
