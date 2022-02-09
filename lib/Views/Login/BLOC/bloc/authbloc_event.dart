part of 'authbloc_bloc.dart';

@immutable
abstract class AuthBlocEvent extends Equatable {}

class AuthSucceedEvent extends AuthBlocEvent {
  AuthSucceedEvent();
  @override
  List<Object> get props => [];
}

class AuthFailedEvent extends AuthBlocEvent {
  AuthFailedEvent();
  @override
  List<Object> get props => [];
}
