import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigandjob_mobile_app/Dominio/Models/Offer.dart';
import 'package:gigandjob_mobile_app/Views/OfferList/OfferListBLOC/offerlist/offerlist_bloc.dart';

class NavigationBarWidget extends StatelessWidget {
  final screens = [];

  //Statefullwidget?
  @override
  Widget build(BuildContext context) {
    int indice = 0;
    //body: screens[current]
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.red,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white54,
      iconSize: 30,
      selectedFontSize: 15,
      unselectedFontSize: 10,
      currentIndex: indice,
      onTap: (index) => /*setState(() =>*/ indice = index /*)*/,
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
  }
}
