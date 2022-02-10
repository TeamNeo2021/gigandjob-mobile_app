import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gigandjob_mobile_app/Widgets/NavigationBar/NavigationBar.dart';
//import 'OfferListBLOC/offerlist/offerlist_bloc.dart';
//import 'OfferListWidgets/OfferListWidget.dart';

class OfferList extends StatefulWidget {
  @override
  _OfferListState createState() => _OfferListState();
}

class _OfferListState extends State<OfferList> {
  @override
  Widget build(BuildContext context) {
    //BlocProvider.of<OfferlistBloc>(context).add(GetAll());
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('aplicaciones'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      /*body:  Column(
        children: <Widget>[*/
      //body: SafeArea(child: OfferListWidget()),
      bottomNavigationBar: NavigationBarWidget(),
    );
  }
}
