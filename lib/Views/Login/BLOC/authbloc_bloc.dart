import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gigandjob_mobile_app/Dominio/Repositories/AuthRepository.dart';
import 'package:gigandjob_mobile_app/Dominio/Services/AuthService.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'authbloc_event.dart';
part 'authbloc_state.dart';

class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  final AuthRepository authRepository;

  AuthBloc({
    required this.authRepository,
  }) : super(AuthInitialState()) {
    on<AuthSucceedEvent>(onAuthSucceed);
    on<AuthOnLoginEvent>(onAuthOnLoginEvent);
    on<AuthFailedEvent>(onAuthFailed);
  }

  Future onAuthOnLoginEvent(
      AuthOnLoginEvent event, Emitter<AuthBlocState> emit) async {
    print('ON AUTH LOGIN EVENT');

    emit(AuthLoadingState());
    final response = await this
        .authRepository
        .login(new AuthEntity(email: event.email, password: event.password));
    print('AUTH BLOC RESPONSE: $response');

    if (response.statusCode == 200 || response.statusCode == 201) {
      // final prefs = await SharedPreferences.getInstance();
      // final String? userId = prefs.getString('id');
      // final String? userEmail = prefs.getString('email');

      print(
          'AUTH BLOC: User logged: ${response.userId} , ${response.userEmail}');

      return emit(AuthSuccessfulState(
          jwt: response.jwt,
          userEmail: response.userEmail,
          userId: response.userId));
    } else {
      print('AUTH BLOC ERROR  ${response}');
      return emit(AuthFailedState(
        errorCode: response.statusCode,
        errorMessage: response.message,
      ));
    }
  }

  Future onAuthSucceed(
      AuthSucceedEvent event, Emitter<AuthBlocState> emit) async {}

  Future onAuthFailed(
      AuthFailedEvent event, Emitter<AuthBlocState> emit) async {}
}
