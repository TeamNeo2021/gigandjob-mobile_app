import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigandjob_mobile_app/Dominio/Models/Offer.dart';
import 'package:gigandjob_mobile_app/Views/DetallesOferta/detalles_oferta.dart';
import 'package:gigandjob_mobile_app/Views/OfferList/OfferListBLOC/offerlist/offerlist_bloc.dart';

class OfferListWidget extends StatelessWidget {
  //List<String> list_Of_Offers = <String>['Prueba1', 'Prueba2', 'Prueba3'];
  String tituloformat = '';
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
                return Container(
                  height: 100,
                  child: Card(
                    color: Colors.white,
                    child: Column(children: [
                      ListTile(
                        title: Text(
                          tituloFormat(list_Of_Offers[index].description),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(list_Of_Offers[index].sector.toString()),
                        trailing: Container(
                          height: double.infinity,
                          child: Column(
                            children: [
                              Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 35,
                              ),
                              Text(
                                list_Of_Offers[index].rating.toString(),
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (contex) => DetallesOfertaPage(
                                        list_Of_Offers[index].offerId,
                                      )));
                          //Navigator.push(context, MaterialPageRoute(builder: (contex) => OfferList())
                        },
                      ),
                    ]),
                  ),
                );
              }),
        );
      },
    );
  }
}

String tituloFormat(String descripcion) {
  String tituloformat = '';
  if (descripcion.length < 15) {
    tituloformat = descripcion.substring(0, descripcion.length);
  } else {
    tituloformat = '${descripcion.substring(0, 14)}...';
  }
  return tituloformat;
}
