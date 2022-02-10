part of 'authbloc_bloc.dart';

abstract class AuthBlocState extends Equatable {
  const AuthBlocState();

  //final User user;

  @override
  List<Object?> get props => [];
}

class AuthSuccessfulState extends AuthBlocState {
  const AuthSuccessfulState(
      {required this.jwt, required this.userId, required this.userEmail});
  final String jwt;
  final String userId;
  final String userEmail;

  @override
  String toString() {
    return 'AuthSuccessfulState{ jwt:$jwt, user: $userId, email: $userEmail}';
  }

  @override
  List<Object?> get props => [userId, userEmail];
}

class AuthFailedState extends AuthBlocState {
  const AuthFailedState({this.errorMessage = '', this.errorCode = ''});

  final String errorMessage;
  final String errorCode;

  @override
  String toString() {
    return 'AuthFailedState{errorMessage: $errorMessage, errorCode: $errorCode}';
  }

  @override
  List<Object?> get props => [errorMessage, errorCode];
}

class AuthLoadingState extends AuthBlocState {}

class AuthInitialState extends AuthBlocState {}
