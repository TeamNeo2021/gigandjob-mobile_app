import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigandjob_mobile_app/Dominio/Models/Offer.dart';
import 'package:gigandjob_mobile_app/Views/OfferList/OfferListBLOC/offerlist/offerlist_bloc.dart';

class NavigationBarWidget extends StatelessWidget {
  //List<String> list_Of_Offers = <String>['Prueba1', 'Prueba2', 'Prueba3'];
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.cases_rounded),
          label: 'Ofertas',
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list_alt_rounded),
          label: 'Aplicaciones',
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today_rounded),
          label: 'Entrevistas',
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Perfil',
          backgroundColor: Colors.blue,
        ),
      ],
    );
  }
}
