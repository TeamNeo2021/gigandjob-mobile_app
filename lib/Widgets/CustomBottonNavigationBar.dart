import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigandjob_mobile_app/Views/MeetingList/MeetingListPage.dart';
import 'package:gigandjob_mobile_app/Views/OfferList/OfferListPage.dart';
import 'package:gigandjob_mobile_app/Views/Profile/ProfilePage.dart';

import 'BottomNavBar/bloc/bottomnavbar_bloc.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);
  static List<Widget> _pages = <Widget>[
    OfferListPage(),
    MeetingListPage(),
    UserProfile()
    // {
    //   page: Page,
    //   icon: Icon.name,
    //   label: 'page'
    // }
  ];

  @override
  Widget build(BuildContext context) {
    final bottomNavBarBloc = context.read<BottomNavBarBloc>();

    return BlocBuilder<BottomNavBarBloc, BottomNavBarState>(
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: state.pageIndex,
          onTap: (index) {
            bottomNavBarBloc.add(
                TabChangedEvent(index: index, page: _pages.elementAt(index)));
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: 'Feed'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Explore'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_rounded), label: 'Profile'),
          ],
        );
      },
    );
  }
}
