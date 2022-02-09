import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:equatable/equatable.dart';
import 'package:gigandjob_mobile_app/Dominio/Models/meeting.dart';

part 'meetinglist_event.dart';
part 'meetinglist_state.dart';

class MeetinglistBloc extends Bloc<MeetinglistEvent, MeetinglistState> {
  MeetinglistBloc() : super(MeetinglistInitial()) {
    on<GetAllMeetings>(_OnGetAllMeetings);
    on<AcceptMeeting>(_OnAcceptMeeting);
    on<RejectMeeting>(_OnRejectMeeting);
  }

  Future<void> _OnGetAllMeetings(
      GetAllMeetings event, Emitter<MeetinglistState> emit) async {
    print('Buscando meetings');
    DateTime now = new DateTime.now();
    DateTime date = new DateTime(now.year, now.month, now.day);
    List<Meeting> Meetings = [];
    await Future.delayed(Duration(seconds: 1), () {
      Meetings.add(Meeting(
          event.CandidateId,
          '111',
          '111',
          '111',
          'Descipcion especial de la oferta',
          date,
          const {'latitude': 01, 'logitude': 012}));
    });
    emit(MeetingsLoaded(Meetings));
  }

  Future<void> _OnAcceptMeeting(
      AcceptMeeting event, Emitter<MeetinglistState> emit) async {
    print('hola2');
  }

  Future<void> _OnRejectMeeting(
      RejectMeeting event, Emitter<MeetinglistState> emit) async {
    print('hola3');
  }
}
