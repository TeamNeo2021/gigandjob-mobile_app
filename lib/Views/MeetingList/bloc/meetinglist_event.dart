part of 'meetinglist_bloc.dart';

abstract class MeetinglistEvent extends Equatable {
  const MeetinglistEvent();

  @override
  List<Object> get props => [];
}

class GetAllMeetings extends MeetinglistEvent {}

class AcceptMeeting extends MeetinglistEvent {
  final String candidateId;
  final String meetingId;
  AcceptMeeting(
    this.candidateId,
    this.meetingId,) : super();
}

class RejectMeeting extends MeetinglistEvent {
  final String candidateId;
  final String meetingId;
  RejectMeeting(
    this.candidateId,
    this.meetingId,) : super();
}