import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigandjob_mobile_app/Dominio/Models/detalles_oferta_model.dart';

import 'bloc/detallesoferta_bloc.dart';

class DetallesOfertaPage extends StatefulWidget {
  DetallesOfertaPage({Key? key}) : super(key: key);

  @override
  _DetallesOfertaPageState createState() => _DetallesOfertaPageState();
}

class _DetallesOfertaPageState extends State<DetallesOfertaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Detalles'),
          backgroundColor: Color.fromRGBO(124, 77, 255, 1.0),
        ),
        body: Container(
            alignment: Alignment.center,
            child: BlocBuilder<DetallesofertaBloc, DetallesofertaState>(
              builder: (context, state) {
                if (state is OfertaCargada) {
                  return buildColumWithData(state.Oferta);
                } else if (state is OfertaLoading) {
                  return buildLoading();
                }
                return throw NullThrownError();
              },
            )));
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Column buildColumWithData(DetallesOferta Detalles) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        CategoriaBotones(),
        Fecha(),
        titulo(),
        LikesPostulaciones(),
        Container(
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 18),
          child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In nec posuere metus. Pellentesque accumsan blandit tortor, sed elementum metus pharetra vel. Vestibulum non viverra nisl, in hendrerit lorem. Aliquam ultricies ipsum ut velit vulputate iaculis. Curabitur rhoncus, justo id vehicula placerat, justo velit rhoncus neque, eget pharetra diam tortor sit amet augue. Mauris in sollicitudin nisl. Praesent'),
        ),
        ResumenEmpleador(),
        BotonPostularse(),
      ],
    );
  }
}

/*Widgets en orden de aparicion*/
Widget CategoriaBotones() {
  return Container(
    //decoration: BoxDecoration(color: Colors.blueGrey[100]),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.5, horizontal: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.blue[200],
                borderRadius: BorderRadius.circular(5)),
            child: Text('Categoria',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300)),
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    debugPrint('Denunciar Pulsado');
                  },
                  icon: Icon(Icons.favorite)),
              IconButton(
                  onPressed: () {
                    debugPrint('Denunciar Pulsado');
                  },
                  icon: Icon(Icons.flag)),
            ],
          )
        ],
      ),
    ),
  );
}

Widget Fecha() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 0.5, horizontal: 18),
    child: Row(
      children: [
        Icon(
          Icons.access_time_filled,
          size: 15,
          color: Colors.grey[600],
        ),
        SizedBox(width: 5),
        Text('Fecha',
            style: TextStyle(
                fontWeight: FontWeight.w200, color: Colors.grey[800])),
      ],
    ),
  );
}

Widget titulo() {
  return Container(
      padding: const EdgeInsets.fromLTRB(18, 0.5, 18, 25),
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: Color.fromRGBO(124, 77, 255, 1.0), width: 1))),
        child: Text('Titulo, largo porque es para un trabajo muy importante',
            style: TextStyle(fontSize: 23)),
      ));
}

Widget ResumenEmpleador() {
  return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 18),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage:
                NetworkImage('https://picsum.photos/id/237/200/300'),
            radius: 50,
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Empleador',
                  style: TextStyle(
                      fontWeight: FontWeight.w200, color: Colors.grey[800])),
              SizedBox(height: 10),
              Text('Nombre del empleador', style: TextStyle(fontSize: 17)),
              SizedBox(height: 10),
              Text('50 trabajos realizados',
                  style: TextStyle(
                      fontWeight: FontWeight.w300, color: Colors.grey[800])),
            ],
          )
        ],
      ));
}

Widget BotonPostularse() {
  return Center(
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: ElevatedButton(
          style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(Size(double.infinity, 20)),
              backgroundColor:
                  MaterialStateProperty.all(Color.fromRGBO(124, 77, 255, 1.0))),
          onPressed: () {
            debugPrint('Postularse Presionado');
          },
          child: Text('Postularse')),
    ),
  );
}

Widget LikesPostulaciones() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 0.5, horizontal: 18),
    child: Row(
      children: [
        Icon(Icons.note_alt_sharp, size: 15, color: Colors.grey[600]),
        SizedBox(width: 5),
        Text('5 postulaciones',
            style: TextStyle(
                fontWeight: FontWeight.w200, color: Colors.grey[800])),
        SizedBox(width: 30),
        Icon(Icons.favorite, size: 15, color: Colors.grey[600]),
        SizedBox(width: 5),
        Text(' 5 likes',
            style: TextStyle(
                fontWeight: FontWeight.w200, color: Colors.grey[800])),
      ],
    ),
  );
}
