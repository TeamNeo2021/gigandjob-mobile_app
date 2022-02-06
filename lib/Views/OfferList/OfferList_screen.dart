import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OfferList extends StatefulWidget {
  @override
  _OfferListState createState() => _OfferListState();
}

class _OfferListState extends State<OfferList> {
  List<String> list_Of_Offers = <String>['Prueba1', 'Prueba2', 'Prueba3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('OfferList'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      /*body:  Column(
        children: <Widget>[*/
      body: SafeArea(
        child: ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: list_Of_Offers.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                color: Colors.amber[200],
                child: ListTile(
                  title: Text(list_Of_Offers[index]),
                ),
              );
            }
            //],
            ),
      ),
    );
  }
}
