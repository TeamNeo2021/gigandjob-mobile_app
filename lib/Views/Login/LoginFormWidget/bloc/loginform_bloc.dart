import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:gigandjob_mobile_app/Dominio/Models/Fields/EmailField.dart';
import 'package:gigandjob_mobile_app/Dominio/Models/Fields/PasswordField.dart';
import 'package:gigandjob_mobile_app/Dominio/Repositories/AuthRepository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'loginform_event.dart';
part 'loginform_state.dart';

class LoginFormBloc extends Bloc<LoginFormEvent, LoginFormState> {
  final AuthRepository authRepository;

  LoginFormBloc({
    required this.authRepository,
  }) : super(LoginFormInitial()) {
    // on<LoginEmailChanged>(onEmailChanged);
    // on<LoginPasswordChanged>(onPasswordChanged);
    on<LoginSubmitted>(onSubmitted);
  }

  //final AuthenticationRepository _authenticationRepository;

  // Future onEmailChanged(
  //   LoginEmailChanged event,
  //   Emitter<LoginFormState> emit,
  // ) async {
  //   final username = EmailField.dirty(event.email);
  //   emit(state.copyWith(
  //     email: username,
  //     status: Formz.validate([state.password, username]),
  //   ));
  // }

  // Future onPasswordChanged(
  //   LoginPasswordChanged event,
  //   Emitter<LoginFormState> emit,
  // ) async {
  //   final password = PasswordField.dirty(event.password);
  //   emit(state.copyWith(
  //     password: password,
  //     status: Formz.validate([password, state.email]),
  //   ));
  // }

  Future onSuccess(
    LoginFormEvent event,
    Emitter<LoginFormState> emit,
  ) async {
    emit(state.copyWith(status: FormzStatus.submissionSuccess));
  }

  Future onFailure(
    LoginFormEvent event,
    Emitter<LoginFormState> emit,
  ) async {
    emit(state.copyWith(status: FormzStatus.submissionFailure));
  }

  Future onSubmitted(
    LoginSubmitted event,
    Emitter<LoginFormState> emit,
  ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        final response = await this.authRepository.login(new AuthEntity(
            email: state.email.value, password: state.password.value));
        print('onAuthOnLoginEvent was succesful: $response');
        if (response) {
          final prefs = await SharedPreferences.getInstance();
          final String? userId = prefs.getString('id');
          final String? userName = prefs.getString('email');

          print('User logged: $userId , $userName');

          return emit(state.copyWith(status: FormzStatus.submissionSuccess));
        } else {
          return emit(state.copyWith(status: FormzStatus.submissionFailure));
        }
        //   emit(state.copyWith(status: FormzStatus.submissionSuccess));
        // } catch (_) {
        //   emit(state.copyWith(status: FormzStatus.submissionFailure));
      } catch (e) {
        print('onAuthOnLoginEvent was failed: $e');
        return emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
  }
}
