import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AplicationsListPage extends StatefulWidget {
  AplicationsListPage({Key? key}) : super(key: key);

  @override
  State<AplicationsListPage> createState() => AplicationsListPageState();
}

class AplicationsListPageState extends State<AplicationsListPage> {
  @override
  Widget build(BuildContext context) {
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
      body: SafeArea(
          child: Text('AplicationsListPage')), //aqui va tu aplicationlistwidget
    );
  }
}
