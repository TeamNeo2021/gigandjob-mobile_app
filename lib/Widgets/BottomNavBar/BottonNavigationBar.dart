import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bottomnavbar_bloc.dart';

class LuisBottomNavigationBar extends StatelessWidget {
  const LuisBottomNavigationBar({Key? key}) : super(key: key);
  static List<Widget> _pages = <Widget>[
    // FeedPage(),
    // ExplorePage(),
    // UserProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    final bottomNavBarBloc = context.read<BottomNavBarBloc>();

    return BlocBuilder<BottomNavBarBloc, BottomNavBarState>(
      builder: (context, currentTab) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.red,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white54,
          iconSize: 30,
          selectedFontSize: 15,
          unselectedFontSize: 10,
          /*currentIndex: indice,
      onTap: (index) => setState(() => indice = index),*/
          items: [
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

        /*return BottomNavigationBar(
          currentIndex: currentTab.index,
          onTap: (index) {
            bottomNavBarBloc.add(TabChangedEvent(
                CurrentBottomNavBar(index, _pages.elementAt(index))));
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: 'Feed'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Explore'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_rounded), label: 'Profile'),
          ],
        );*/
      },
    );
  }
}
