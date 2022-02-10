import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MeetingListPage extends StatefulWidget {
  MeetingListPage({Key? key}) : super(key: key);

  @override
  State<MeetingListPage> createState() => _MeetingListPageState();
}

class _MeetingListPageState extends State<MeetingListPage> {
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
      body: SafeArea(child: Text('Meeting')), //aqui va tu meetinglistwidget
    );
  }
}
