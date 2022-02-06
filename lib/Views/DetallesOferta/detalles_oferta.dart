import 'package:flutter/material.dart';


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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CategoriaBotones(),            
            Text('Fecha'),
            Text('Titulo'),
            Container(
              child: Text('Descripción'),
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(124, 77, 255, 1.0))),
                onPressed: () {
                  debugPrint('Postularse Presionado');
                },
                child: Text('Postularse'))
          ],
        ));
  }
}

Widget CategoriaBotones() {
  return Container(
    decoration: BoxDecoration(color: Colors.blueGrey[100]),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical:0.5,horizontal:18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Categoria'),
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
