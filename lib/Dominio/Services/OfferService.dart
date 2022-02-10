import 'package:gigandjob_mobile_app/Dominio/Models/detalles_oferta_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:gigandjob_mobile_app/Views/DetallesOferta/bloc/detallesoferta_bloc.dart';

class OfferService {
  String ApiRoute = 'http://localhost:3000';

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
      http.Response response = await http.get(Uri.parse(ApiRoute));
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
}


/*
class _HomePageState extends State<HomePage> {
  String ApiRoute = 'http://192.168.1.5:3000/products';
  List<dynamic> data = [];
  List productsData = [];
  getProducts() async {
    try {
      http.Response response = await http.get(Uri.parse(ApiRoute));
      debugPrint(response.body);
      data = json.decode(response.body);
      setState(() {
        productsData = data;
      });
    } catch (err) {
      debugPrint('Error ${err}');
    }
  } 

class FormPage extends StatelessWidget {
  final Map updateItem;
  String ApiRoute = 'http://192.168.1.5:3000/products';
  FormPage(this.updateItem, {Key? key}) : super(key: key);

  CreateProduct(Nombre, Descripcion, Precio) async {
    try {
      debugPrint('Crear Presioando');
      http.Response response = await http.post(Uri.parse(ApiRoute),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8"
          },
          body: jsonEncode(<String, String>{
            "title": Nombre,
            "description": Descripcion,
            "price": Precio
          }));
    } catch (err) {
      debugPrint('Error ${err}');
    }
  }

  updateProduct(id, Nombre, Descripcion, Precio) async {
    try {
      debugPrint('Crear Presioando');
      http.Response response = await http.patch(Uri.parse("${ApiRoute}/${id}"),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8"
          },
          body: jsonEncode(<String, String>{
            "title": Nombre,
            "description": Descripcion,
            "price": Precio
          }));
    } catch (err) {
      debugPrint('Error ${err}');
    }
  }*/