import 'package:gigandjob_mobile_app/Dominio/Models/Offer.dart';
import 'package:gigandjob_mobile_app/Dominio/Models/detalles_oferta_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:gigandjob_mobile_app/Views/DetallesOferta/bloc/detallesoferta_bloc.dart';

class OfferService {
  //String ApiRoute = 'https://salvacion-git-job.herokuapp.com/offer';
  String ApiRoute = 'http://192.168.1.119:5000/Offer';

  Future<void> EnviarAplicacion(Aplicar aplicacion) async {
    try {
      print('Enviando la vaina pa la api');
      http.Response response = await http.put(
          Uri.parse('$ApiRoute/applyToOffer'),
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
      print(response.body);
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
      int apli = 0;       
      int repo = 0;
      if (data['applications'] != null) {
        List<dynamic> app = data['applications'];
        apli = app.length;
      }
      if (data['reports'] != null) {
        List<dynamic> rep = data['reports'];
        repo = rep.length;
      }
      detalles = new DetallesOferta(
          data['OfferId'],
          data['State'],
          DateTime.now(), //data['PublicationDate'],
          data['Rating'],
          data['Sector'],
          data['Budget'],
          data['Description'],
          apli,
          repo);
      return detalles;
    } catch (err) {
      throw err;
    }
  }

  Future<void> DenunciarOferta(String OfferId) async {
    dynamic data;
    DetallesOferta detalles;
    try {
      http.Response response = await http.post(
          Uri.parse('$ApiRoute/$OfferId/getone'),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8"
          },
          body: jsonEncode(<String, String>{
            'reportedOffer': OfferId,
            'reason': 'Esta oferta es ofensiva'
          }));
      print(response.body);
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
        lista.add(new OfferDTO(
          dato['OfferId'],
          dato['Rating'],
          dato['Sector'],
          dato['Description'],
        ));
      }
      return lista;
    } catch (err) {
      throw err;
    }
  }
}
