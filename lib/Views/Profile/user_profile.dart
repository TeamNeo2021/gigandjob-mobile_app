import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigandjob_mobile_app/Dominio/Models/user.dto.dart';
import 'package:gigandjob_mobile_app/Views/Login/BLOC/authbloc_bloc.dart';
import 'package:gigandjob_mobile_app/Views/Profile/user_translate.dart';

import 'Widgets/profile_image_widget.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    final UserDto user = UserTranslate().translate(true);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            ProfileImageWidget(
              imagePath: user.image,
            ),
            const SizedBox(height: 24),
            buildName(user.name, user.lastname, user.email),
            const SizedBox(height: 48),
            buildAbout(user),
            MaterialButton(
              color: Colors.redAccent,
              onPressed: () {
                BlocProvider.of<AuthBloc>(context)
                    .add(AuthLogoutEvent(userId: 1));
                void _close() {
                  Navigator.pop(context);
                }

                _close();
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildName(String name, String lastname, String email) => Column(
        children: [
          Text(
            name + ' ' + lastname,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            email,
            style: const TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildAbout(UserDto user) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Informacion',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              user.description,
              style: const TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}
