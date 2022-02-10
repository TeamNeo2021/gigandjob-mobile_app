part of 'signup_bloc.dart';

enum SignUpStatus { initial, register, failure }

class SignupState extends Equatable {
  final SignUpStatus status;

  const SignupState({
    this.status = SignUpStatus.initial,
  });

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'SignUpStatus{status: $status}';
  }
}

class SignupInitial extends SignupState {}
