//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'OfferListWidgets/OfferListWidget.dart';

class OfferList extends StatefulWidget {
  @override
  _OfferListState createState() => _OfferListState();
}

class _OfferListState extends State<OfferList> {
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
      body: SafeArea(child: OfferListWidget()),
    );
  }
}
