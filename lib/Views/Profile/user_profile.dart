import 'package:flutter/material.dart';
import 'package:gigandjob_mobile_app/Dominio/Models/user.dto.dart';
import 'package:gigandjob_mobile_app/Views/Profile/user.dart';

import 'Widgets/profile_widget.dart';

class UserProfile extends StatefulWidget {
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
            ProfileWidget(
              imagePath: user.image,
              onClicked: () async {},
            ),
            const SizedBox(height: 24),
            buildName(user),
            //const SizedBox(height: 24),
            //const NumbersWidget(),
            const SizedBox(height: 48),
            buildAbout(user),
          ],
        ),
      ),
    );
  }

  Widget buildName(UserDto user) => Column(
        children: [
          Text(
            user.name + ' ' + user.lastname,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
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
