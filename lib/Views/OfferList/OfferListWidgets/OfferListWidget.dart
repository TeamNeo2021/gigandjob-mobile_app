import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigandjob_mobile_app/Dominio/Models/Offer.dart';
import 'package:gigandjob_mobile_app/Views/OfferList/OfferListBLOC/offerlist/offerlist_bloc.dart';

class OfferListWidget extends StatelessWidget {
  //List<String> list_Of_Offers = <String>['Prueba1', 'Prueba2', 'Prueba3'];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OfferlistBloc, OfferlistState>(
      builder: (context, state) {
        List<OfferDTO> list_Of_Offers = state.offer;
        return Container(
          child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: list_Of_Offers.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: Colors.amber[200],
                  child: Column(children: [
                    ListTile(
                      title: Text(list_Of_Offers[index].offerName),
                    ),
                  ]),
                );
              }
              //],
              ),
        );
      },
    );
  }
}
