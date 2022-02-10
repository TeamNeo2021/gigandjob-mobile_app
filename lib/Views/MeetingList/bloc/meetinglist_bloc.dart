import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:equatable/equatable.dart';
import 'package:gigandjob_mobile_app/Dominio/Models/meeting.dart';
import 'package:gigandjob_mobile_app/Dominio/Services/MeetingService.dart';

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
    List<Meeting> Meetings = [];
    MeetingService service = new MeetingService();
    Meetings = await service.getMeetings(event.CandidateId);
    emit(MeetingsLoaded(Meetings));
  }

  Future<void> _OnAcceptMeeting(
      AcceptMeeting event, Emitter<MeetinglistState> emit) async {
    MeetingService service = new MeetingService();
    await service.acceptMeeting(event);
  }

  Future<void> _OnRejectMeeting(
      RejectMeeting event, Emitter<MeetinglistState> emit) async {
    MeetingService service = new MeetingService();
    await service.rejectMeeting(event);
  }
}
