import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'OfferListBLOC/offerlist/offerlist_bloc.dart';
import 'OfferListWidgets/OfferListWidget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OfferListPage extends StatefulWidget {
  OfferListPage({Key? key}) : super(key: key);

  @override
  State<OfferListPage> createState() => _OfferListPageState();
}

class _OfferListPageState extends State<OfferListPage> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<OfferlistBloc>(context).add(GetAll());
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text(
          '      Gig&Job',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        foregroundColor: Colors.deepPurple[800],
        backgroundColor: Colors.white,
      ),
      /* body:  Column(
        children: <Widget>[*/
      body: SafeArea(child: OfferListWidget()),
      /*body: screens[currentIndex],
      bottomNavigationBar: NavigationBarWidget(),*/
    );
  }
}
