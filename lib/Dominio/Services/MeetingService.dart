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
  // ignore: non_constant_identifier_names
  //String ApiRoute = 'https://salvacion-git-job.herokuapp.com';
  String ApiRoute = 'http://192.168.1.119:5000';

  Future<List<Meeting>> getMeetings(String? candidateId) async {
    dynamic data;
    dynamic Estado;
    List<Meeting> lista = [];
    try {
      print(candidateId);
      http.Response response =
          await http.get(Uri.parse('$ApiRoute/meeting/$candidateId/getall'));
      print(response.body);
      data = json.decode(response.body);
      for (var dato in data) {
        Estado = dato['state'];
        if (Estado is int) {
          Estado = stateNumberToString(Estado);
        }
        print(data);
        lista.add(new Meeting(
          dato['candidate'],
          dato['employer'],
          dato['id'],
          Estado,
          dato['description'],
          DateTime.now(), //new DateTime(dato['date']),
          //dato['location'],
        ));
      }
      return lista;
    } catch (err) {
      throw err;
    }
  }

  Future<void> acceptMeeting(AcceptMeeting event) async {
    try {
      print('llamando a la api');
      http.Response response = await http.put(
          Uri.parse('$ApiRoute/meeting/accept'),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8"
          },
          body: jsonEncode(<String, String>{
            'candidateId': event.candidateId,
            'meetingId': event.meetingId,
          }));
      print(response.body);
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
      print(response.body);
    } catch (err) {
      throw err;
    }
  }

  String stateNumberToString(int state) {
    switch (state) {
      case 0:
        return 'Active';
        break;
      case 1:
        return 'Suspended';
        break;
      case 2:
        return 'Canceled';
        break;
      case 3:
        return 'Pending';
        break;
      case 4:
        return 'Rejected';
        break;
      default:
        return 'Pending';
    }
  }
}
