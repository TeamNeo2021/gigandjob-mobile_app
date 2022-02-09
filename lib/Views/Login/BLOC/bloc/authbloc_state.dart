part of 'authbloc_bloc.dart';

enum AuthBlocStatus { initial, loggedIn, failure }

class AuthBlocState extends Equatable {
  const AuthBlocState({
    this.status = AuthBlocStatus.initial,
  });

  final AuthBlocStatus status;
  //final User user;

  @override
  String toString() {
    return 'AuthblocState{status: $status}';
  }

  @override
  List<Object?> get props => [status];
}

class AuthblocInitial extends AuthBlocState {}
