// ignore_for_file: prefer_typing_uninitialized_variables

part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable {}

class SignupSucceedEvent extends SignupEvent {
  SignupSucceedEvent();
  @override
  List<Object> get props => [];
}

class SignupFailedEvent extends SignupEvent {
  SignupFailedEvent();
  @override
  List<Object> get props => [];
}

class SignupOnRegisterEvent extends SignupEvent {
  final name;
  final lastname;
  final phone;
  final bday;
  final longitud;
  final latitude;
  final email;
  final password;

  SignupOnRegisterEvent({
    @required this.name,
    @required this.lastname,
    @required this.phone,
    @required this.bday,
    @required this.longitud,
    @required this.latitude,
    @required this.email,
    @required this.password,
  });

  @override
  List<Object> get props => [];
}
