part of 'meetinglist_bloc.dart';

abstract class MeetinglistState extends Equatable {
  const MeetinglistState();

  @override
  List<Object> get props => [];
}

class MeetinglistInitial extends MeetinglistState {}

class MeetingsLoaded {
  final List<Meeting> Meetings;

  MeetingsLoaded(this.Meetings) : super();
}
