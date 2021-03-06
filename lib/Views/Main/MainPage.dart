import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigandjob_mobile_app/Views/Login/BLOC/authbloc_bloc.dart';
import 'package:gigandjob_mobile_app/Views/Login/LoginPage.dart';
import 'package:gigandjob_mobile_app/Widgets/BottomNavBar/bloc/bottomnavbar_bloc.dart';
import 'package:gigandjob_mobile_app/Widgets/CustomBottonNavigationBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    // final prefs = getSharedPreferences();
    return BlocBuilder<AuthBloc, AuthBlocState>(
      bloc: authBloc,
      // listener: (context, state) {},
      builder: (context, state) {
        if (state is AuthSuccessfulState) {
          authBloc.add(AuthSucceedEvent(
            jwt: state.jwt,
            id: state.userId,
            email: state.userEmail,
          ));
          return buildHomePage();
        // } else if ( await isUserLoggedIn()) {
        //   return buildHomePage();
        } else {
          return LoginPage();
        }
      },
    );
  }

  Future<bool> isUserLoggedIn() async {
    final prefs = getSharedPreferences();
    return await prefs.getString('jwt') != '' ? true : false;
  }

  getSharedPreferences() async {
    return await SharedPreferences.getInstance();
  }

  buildHomePage() {
    return BlocBuilder<BottomNavBarBloc, BottomNavBarState>(
      builder: (context, state) {
        return Scaffold(
            // body: BlocBuilder<BottomNavBarBloc, BottomNavBarState>(
            //   builder: (context, currentTab) {
            //     return currentTab.page;
            //   },
            // ),
            body: state.pageWidget,
            bottomNavigationBar: CustomBottomNavigationBar());
      },
    );
  }
}
