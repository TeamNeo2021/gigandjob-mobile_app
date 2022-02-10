import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigandjob_mobile_app/Views/AplicationsList/AplicationsListPage.dart';
import 'package:gigandjob_mobile_app/Views/MeetingList/MeetingListPage.dart';
import 'package:gigandjob_mobile_app/Views/OfferList/OfferListPage.dart';
import 'package:gigandjob_mobile_app/Views/Profile/ProfilePage.dart';

import 'BottomNavBar/bloc/bottomnavbar_bloc.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);
  static List<Widget> _pages = <Widget>[
    OfferListPage(),
    AplicationsListPage(),
    MeetingListPage(),
    ProfilePage()
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
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.deepPurple[800],
          unselectedItemColor: Colors.grey[700],
          iconSize: 30,
          selectedFontSize: 15,
          unselectedFontSize: 10,
          currentIndex: state.pageIndex,
          onTap: (index) {
            bottomNavBarBloc.add(
                TabChangedEvent(index: index, page: _pages.elementAt(index)));
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.cases_rounded),
              label: 'Ofertas',
              //backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_rounded),
              label: 'Aplicaciones',
              //backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_rounded),
              label: 'Entrevistas',
              //backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Perfil',
              //backgroundColor: Colors.blue,
            ),
          ],
        );
      },
    );
  }
}
