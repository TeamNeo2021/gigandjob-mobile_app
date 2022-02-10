import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigandjob_mobile_app/Dominio/Models/detalles_oferta_model.dart';

import 'bloc/detallesoferta_bloc.dart';

class DetallesOfertaPage extends StatefulWidget {
  final String offerId;
  DetallesOfertaPage(this.offerId, {Key? key}) : super(key: key);

  @override
  _DetallesOfertaPageState createState() => _DetallesOfertaPageState();
}

class _DetallesOfertaPageState extends State<DetallesOfertaPage> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DetallesofertaBloc>(context).add(GetOferta(widget.offerId));
    return Scaffold(
        appBar: AppBar(
          title: Text('Detalles'),
          backgroundColor: Color.fromRGBO(124, 77, 255, 1.0),
        ),
        body: SingleChildScrollView(
          child: Container(
              alignment: Alignment.center,
              child: BlocBuilder<DetallesofertaBloc, DetallesofertaState>(
                builder: (context, state) {
                  if (state is OfertaCargada) {
                    return buildColumWithData(state.Oferta);
                  } else if (state is OfertaLoading ||
                      state is DetallesofertaInitial) {
                    return buildLoading();
                  }
                  return throw NullThrownError();
                },
              )),
        ));
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
        CategoriaBotones(Detalles.Sector),
        //Fecha(Detalles.PublicationDate),
        titulo(),
        LikesPostulaciones(Detalles.Rating),
        Container(
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 18),
          child: Text(Detalles.Description),
        ),
        //ResumenEmpleador(),
        OpcionesPostulacion(context, '21'),
      ],
    );
  }
}

/*Widgets en orden de aparicion*/
Widget CategoriaBotones(int Categoria) {
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
            child: Text(Categoria.toString(),
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300)),
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    debugPrint('Like Pulsado');
                  },
                  icon: Icon(Icons.favorite)),
              IconButton(
                  onPressed: () {
                    
                  },
                  icon: Icon(Icons.flag)),
            ],
          )
        ],
      ),
    ),
  );
}

Widget Fecha(DateTime fecha) {
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
        Text('${fecha.day}/${fecha.month}/${fecha.year}',
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

Widget LikesPostulaciones(int likes) {
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
        Text('$likes likes',
            style: TextStyle(
                fontWeight: FontWeight.w200, color: Colors.grey[800])),
      ],
    ),
  );
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

Widget OpcionesPostulacion(BuildContext context, String OfferId) {
  List<TextEditingController> Controllers = [];
  TextEditingController PreController = TextEditingController();
  TextEditingController DurController = TextEditingController();
  TextEditingController descController = TextEditingController();
  Controllers.add(PreController);
  Controllers.add(DurController);
  Controllers.add(descController);
  final _Formkey = GlobalKey<FormState>();
  return Container(
      padding: EdgeInsets.fromLTRB(18, 50, 18, 20),
      child: Form(
        key: _Formkey,
        child: Column(
          children: [
            Text('Postulación', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa un presupuesto';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                controller: PreController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Presupuesto')),
            SizedBox(height: 20),
            TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa una duración';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                controller: DurController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Duracion(Días)')),
            SizedBox(height: 20),
            TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa una propuesta';
                  }
                  return null;
                },
                maxLines: 5,
                controller: descController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Propuesta')),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                  style: ButtonStyle(
                      fixedSize:
                          MaterialStateProperty.all(Size(double.infinity, 20)),
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromRGBO(124, 77, 255, 1.0))),
                  onPressed: () {
                    if (_Formkey.currentState!.validate()) {
                      postularse(Controllers, context, OfferId);
                    }
                  },
                  child: Text('Postularse')),
            )
          ],
        ),
      ));
}

void postularse(
    List<TextEditingController> Controllers, context, String OfferId) {
  debugPrint('Postularse Presionado');
  try {
    BlocProvider.of<DetallesofertaBloc>(context).add(Aplicar(
        OfferId,
        '11', //Falta obtenerlo cuando se implemente el login
        '22', //Considerando quitarlo
        '0', //Considerando Quitarlo
        int.parse(Controllers[0].text),
        Controllers[2].text,
        int.parse(Controllers[1].text)));
  } catch (err) {
    print('ERROR:$err');
  }
}
