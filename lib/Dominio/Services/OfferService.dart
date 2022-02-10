import 'dart:ffi';
import 'package:gigandjob_mobile_app/Dominio/Models/detalles_oferta_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:gigandjob_mobile_app/Views/DetallesOferta/bloc/detallesoferta_bloc.dart';

class OfferService {
  String ApiRoute = 'https://salvacion-git-job.herokuapp.com';

  Future<void> EnviarAplicacion(Aplicar aplicacion) async {
    try {
      print('Enviando la vaina pa la api');
      http.Response response = await http.post(Uri.parse('$ApiRoute/offer/applyToOffer'),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8"
          },
          body: jsonEncode(<String, String>{
            'offerId': aplicacion.OfferId,
            'employerId': aplicacion.employerId,
            'candidateId': aplicacion.candidateId,
            'state': aplicacion.state,
            'budget': aplicacion.budget.toString(),
            'description': aplicacion.description,
            'duration_days': aplicacion.duration_days.toString(),
          }));
    } catch (err) {
      print(err);
    }
  }

  Future<DetallesOferta> FetchDetallesOferta(String OfferId) async {
    dynamic data;
    DetallesOferta detalles;
    try {
      http.Response response = await http.get(Uri.parse('$ApiRoute/$OfferId/getone'));
      print(response.body);
      data = json.decode(response.body);
      detalles = new DetallesOferta(
        data['OfferId'], 
        data['Description'], 
        new DateTime(data['PublicationDate']),
        data['Rating'],
        data['Direction'], 
        data['Sector'], 
        int.parse(data['Budget']), 
        data['Description']);
      return detalles;
    } catch (err) {
      throw err;
    }
  }

  Future<void> DenunciarOferta(String OfferId) async {
    dynamic data;
    DetallesOferta detalles;
    try {
      http.Response response = await http.post(Uri.parse('$ApiRoute/$OfferId/getone'),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8"
          },
          body: jsonEncode(<String, String>{
            'reportedOffer': OfferId,
            'reason':'Esta oferta es ofensiva'
          }));
      print(response.body);
    } catch (err) {
      throw err;
    }
  }

}
