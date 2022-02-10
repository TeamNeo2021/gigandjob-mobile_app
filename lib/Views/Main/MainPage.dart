import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigandjob_mobile_app/Views/Login/BLOC/authbloc_bloc.dart';
import 'package:gigandjob_mobile_app/Views/Login/LoginPage.dart';
import 'package:gigandjob_mobile_app/Widgets/BottomNavBar/bloc/bottomnavbar_bloc.dart';
import 'package:gigandjob_mobile_app/Widgets/CustomBottonNavigationBar.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthBlocState>(
      bloc: BlocProvider.of<AuthBloc>(context),
      // listener: (context, state) {},
      builder: (context, state) {
        if (state.status == AuthBlocStatus.loggedIn) {
          //travel to Main
          return buildHomePage();
        } else {
          return LoginPage();
        }
      },
    );
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
