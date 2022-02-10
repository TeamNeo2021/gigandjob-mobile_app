import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigandjob_mobile_app/Views/Login/BLOC/authbloc_bloc.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();

  /*appBar: AppBar(
        title: Text(
          '      Gig&Job',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        foregroundColor: Colors.deepPurple[800],
        backgroundColor: Colors.white,
      ),*/
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Profile Page',
            style: Theme.of(context).textTheme.headline4,
          ),
          MaterialButton(
            color: Colors.redAccent,
            onPressed: () => BlocProvider.of<AuthBloc>(context)
                .add(AuthLogoutEvent(userId: 1)),
            child: Text('Logout'),
          ),
        ],
      ),
    );
  }
}
