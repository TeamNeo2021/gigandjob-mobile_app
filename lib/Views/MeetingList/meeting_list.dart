import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gigandjob_mobile_app/Dominio/Models/meeting.dart';
import 'package:gigandjob_mobile_app/Widgets/NavigationBar/NavigationBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bloc/meetinglist_bloc.dart';

class MeetingList extends StatefulWidget {
  @override
  _MeetingListState createState() => _MeetingListState();
}

class _MeetingListState extends State<MeetingList> {
  @override
  Widget build(BuildContext context) {
    final pref = SharedPreferences.getInstance();
    BlocProvider.of<MeetinglistBloc>(context)
        .add(GetAllMeetings('bace587b-ef79-4ee1-8d6e-db524dfb24cd' /*pref.*/));
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
      body: Container(
          alignment: Alignment.center,
          child: BlocBuilder<MeetinglistBloc, MeetinglistState>(
            builder: (context, state) {
              if (state is MeetingsLoaded) {
                return ListaMeetings(state.Meetings);
              } else if (state is MeetinglistInitial) {
                return buildLoading();
              }
              return throw NullThrownError();
            },
          )),
    );
  }
}

Widget buildLoading() {
  return Center(
    child: CircularProgressIndicator(),
  );
}

Widget ListaMeetings(List<Meeting> Meetings) {
  return Container(
    child: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: Meetings.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Colors.amber[200],
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(Meetings[index].description),
                      Text('${Meetings[index].date}'),
                    ],
                  ),
                ),
                SizedBox(width: 5),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          debugPrint('Aceptar');
                          BlocProvider.of<MeetinglistBloc>(context).add(
                              AcceptMeeting(Meetings[index].id,
                                  Meetings[index].candidate));
                        },
                        icon: Icon(Icons.check)),
                    IconButton(
                        onPressed: () {
                          debugPrint('Aceptar');
                          BlocProvider.of<MeetinglistBloc>(context)
                              .add(RejectMeeting(
                            Meetings[index].id,
                            Meetings[index].candidate,
                          ));
                        },
                        icon: Icon(Icons.cancel)),
                  ],
                ),
              ],
            ),
          );
        }),
  );
}
