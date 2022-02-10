import 'package:gigandjob_mobile_app/Dominio/Models/Offer.dart';
import 'package:gigandjob_mobile_app/Dominio/Models/detalles_oferta_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:gigandjob_mobile_app/Views/DetallesOferta/bloc/detallesoferta_bloc.dart';

class OfferService {
  String ApiRoute = 'http://192.168.86.26:3000/offer'; //AQUI VA EL IP DE HOST

  Future<void> EnviarAplicacion(Aplicar aplicacion) async {
    try {
      print('Enviando la vaina pa la api');
      http.Response response = await http.post(
          Uri.parse('$ApiRoute/offer/applyToOffer'),
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
      http.Response response =
          await http.get(Uri.parse('$ApiRoute/$OfferId/getone'));
      print(response.body);
      data = json.decode(response.body);
      detalles = new DetallesOferta(
          data['OfferId'],
          data['Description'],
          //data['PublicationDate'],
          data['Rating'],
          data['Direction'],
          data['Sector'],
          (data['Budget']),
          data['Description']);
      return detalles;
    } catch (err) {
      throw err;
    }
  }

  Future<List<OfferDTO>> FetchOfertas() async {
    dynamic data;
    List<OfferDTO> lista = [];
    try {
      http.Response response = await http.get(Uri.parse('$ApiRoute/getall'));
      print(response.body);
      data = json.decode(response.body);
      for (var dato in data) {
        lista.add(new OfferDTO(dato['OfferId'], dato['Description']));
      }
      return lista;
    } catch (err) {
      throw err;
    }
  }
}
