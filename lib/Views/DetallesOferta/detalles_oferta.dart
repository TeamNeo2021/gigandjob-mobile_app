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
        CategoriaBotones(Detalles.Sector, context, widget.offerId),
        //Fecha(Detalles.PublicationDate),
        titulo(Detalles.Description),
        LikesPostulaciones(
            Detalles.Rating, Detalles.applications, Detalles.reports),
        Container(
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 18),
          child: Text(Detalles.Description),
        ),
        //ResumenEmpleador(),
        OpcionesPostulacion(context, widget.offerId),
      ],
    );
  }
}

/*Widgets en orden de aparicion*/
Widget CategoriaBotones(int Categoria, BuildContext context, String offerId) {
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
                    print(offerId);
                    BlocProvider.of<DetallesofertaBloc>(context)
                        .add(Denunciar(offerId));
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

Widget titulo(String titulo) {  
  String tituloformat = '';
  if (titulo.length < 15) {    
    tituloformat = titulo.substring(0, titulo.length);
  } else {
    tituloformat = '${titulo.substring(0,14)}...';
  }
  return Container(
      padding: const EdgeInsets.fromLTRB(18, 0.5, 18, 25),
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: Color.fromRGBO(124, 77, 255, 1.0), width: 1))),
        child: Text('${tituloformat}...',
            style: TextStyle(fontSize: 23)),
      ));
}

Widget LikesPostulaciones(int likes, int postulaciones, int reportes) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 0.5, horizontal: 18),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(Icons.note_alt_sharp, size: 15, color: Colors.grey[600]),
        Text('$postulaciones postulaciones',
            style: TextStyle(
                fontWeight: FontWeight.w200, color: Colors.grey[800])),
        Icon(Icons.favorite, size: 15, color: Colors.grey[600]),
        Text('$likes likes',
            style: TextStyle(
                fontWeight: FontWeight.w200, color: Colors.grey[800])),
        Icon(Icons.flag, size: 15, color: Colors.grey[600]),
        Text('$reportes reportes',
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
            Text('Postulaci??n', style: TextStyle(fontSize: 20)),
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
                    return 'Por favor ingresa una duraci??n';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                controller: DurController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Duracion(D??as)')),
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
    List<TextEditingController> controllers, context, String OfferId) {
  debugPrint('Postularse Presionado');
  try {
    BlocProvider.of<DetallesofertaBloc>(context).add(Aplicar(
        OfferId,
        '22', //Considerando quitarlo
        '0', //Considerando Quitarlo
        int.parse(controllers[0].text),
        controllers[2].text,
        int.parse(controllers[1].text)));
    controllers[0].text = '';
    controllers[1].text = '';
    controllers[2].text = '';
  } catch (err) {
    print('ERROR:$err');
  }
}
