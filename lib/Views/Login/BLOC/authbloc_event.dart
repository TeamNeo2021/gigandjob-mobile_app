part of 'authbloc_bloc.dart';

@immutable
abstract class AuthBlocEvent extends Equatable {}

class AuthSucceedEvent extends AuthBlocEvent {
  final id;
  final email;
  AuthSucceedEvent({
    @required this.id,
    @required this.email,
  });
  @override
  List<Object> get props => [];
}

class AuthOnLoginEvent extends AuthBlocEvent {
  final email;
  final password;
  AuthOnLoginEvent({
    @required this.email,
    @required this.password,
  });
  @override
  List<Object> get props => [email, password];
}

class AuthLogoutEvent extends AuthBlocEvent {
  final userId;
  AuthLogoutEvent({
    @required this.userId,
  });
  @override
  List<Object> get props => [userId];
}

class AuthFailedEvent extends AuthBlocEvent {
  @override
  List<Object> get props => [];
}
