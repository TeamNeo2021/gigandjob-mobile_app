import 'dart:ffi';
import 'package:gigandjob_mobile_app/Dominio/Models/detalles_oferta_model.dart';
import 'package:gigandjob_mobile_app/Dominio/Models/meeting.dart';
import 'package:gigandjob_mobile_app/Views/MeetingList/bloc/meetinglist_bloc.dart';
import 'package:gigandjob_mobile_app/Views/MeetingList/bloc/meetinglist_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:gigandjob_mobile_app/Views/DetallesOferta/bloc/detallesoferta_bloc.dart';

class MeetingService {
  String ApiRoute = 'http://localhost:3000';

  Future<List<Meeting>> getMeetings(String candidateId) async {
    dynamic data;
    List<Meeting> lista = [];
    try {
      http.Response response = await http
          .get(Uri.parse('$ApiRoute/meeting/$candidateId/getall'));
      print(response.body);
      data = json.decode(response.body);
      for (var dato in data) {
        lista.add(new Meeting(
          dato['candidate'],
          dato['employer'],
          dato['id'],
          dato['state'],
          dato['description'],
          DateTime.now(), //new DateTime(dato['date']),
          dato['location'],
        ));
      }
      return lista;
    } catch (err) {
      throw err;
    }
  }

  Future<void> acceptMeeting(AcceptMeeting event) async {
    try {
      http.Response response = await http.put(
          Uri.parse('$ApiRoute/meeting/accept'),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8"
          },
          body: jsonEncode(<String, String>{
            'candidateId': event.candidateId,
            'meetingId': event.meetingId,
          }));
    } catch (err) {
      throw err;
    }
  }

  Future<void> rejectMeeting(RejectMeeting event) async {
    try {
      http.Response response = await http.put(
          Uri.parse('$ApiRoute/meeting/reject'),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8"
          },
          body: jsonEncode(<String, String>{
            'candidateId': event.candidateId,
            'meetingId': event.meetingId,
          }));
    } catch (err) {
      throw err;
    }
  }
}
