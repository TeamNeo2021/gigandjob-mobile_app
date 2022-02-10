part of 'loginform_bloc.dart';

abstract class LoginFormState extends Equatable {
  const LoginFormState({
    this.status = FormzStatus.pure,
    this.email = const EmailField.pure(),
    this.password = const PasswordField.pure(),
  });

  final FormzStatus status;
  final EmailField email;
  final PasswordField password;

  @override
  List<Object> get props => [status, email, password];

  LoginFormState copyWith({
    FormzStatus? status,
    EmailField? email,
    PasswordField? password,
  }) {
    return LoginFormChangedState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}

class LoginFormInitial extends LoginFormState {
  const LoginFormInitial({
    status = FormzStatus.pure,
    email = const EmailField.pure(),
    password = const PasswordField.pure(),
  });
}

class LoginFormChangedState extends LoginFormState {
  const LoginFormChangedState({
    status = FormzStatus.pure,
    email = const EmailField.pure(),
    password = const PasswordField.pure(),
  });
}
