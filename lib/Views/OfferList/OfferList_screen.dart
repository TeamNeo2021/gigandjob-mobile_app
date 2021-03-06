//import 'dart:html';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gigandjob_mobile_app/Widgets/NavigationBar/NavigationBar.dart';
import 'OfferListBLOC/offerlist/offerlist_bloc.dart';
import 'OfferListWidgets/OfferListWidget.dart';

class OfferList extends StatefulWidget {
  @override
  _OfferListState createState() => _OfferListState();
}

class _OfferListState extends State<OfferList> {
  int currentIndex = 0;
  final screens = [
    Center(
      child: Text('Home', style: TextStyle(fontSize: 60)),
    ),
    Center(
      child: Text('Aplicaciones', style: TextStyle(fontSize: 60)),
    ),
    Center(
      child: Text('Meeting', style: TextStyle(fontSize: 60)),
    ),
    Center(
      child: Text('Perfil', style: TextStyle(fontSize: 60)),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<OfferlistBloc>(context).add(GetAll());
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('OfferList'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      /*body:  Column(
        children: <Widget>[*/
      //body: SafeArea(child: OfferListWidget()),
      body: screens[currentIndex],
      bottomNavigationBar: NavigationBarWidget(),
    );
  }
}
