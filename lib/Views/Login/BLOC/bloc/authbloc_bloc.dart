import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gigandjob_mobile_app/Dominio/Repositories/AuthRepository.dart';
import 'package:gigandjob_mobile_app/Dominio/Services/AuthService.dart';
import 'package:meta/meta.dart';

part 'authbloc_event.dart';
part 'authbloc_state.dart';

class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  final authRepository = AuthService();

  AuthBloc() : super(AuthblocInitial()) {
    // on<AuthblocEvent>((event, emit) {
    //   // TODO: implement event handler
    // });

    on<AuthSucceedEvent>(onAuthSucceed);
    on<AuthOnLoginEvent>(onAuthOnLoginEvent);
    on<AuthFailedEvent>(onAuthFailed);
  }

  Future onAuthOnLoginEvent(
      AuthOnLoginEvent event, Emitter<AuthBlocState> emit) async {
    try {
      this
          .authRepository
          .login(new AuthEntity(email: event.email, password: event.password));
      emit(AuthBlocState(status: AuthBlocStatus.initial));
    } catch (e) {
      emit(AuthBlocState(status: AuthBlocStatus.failure));
    }
  }

  Future onAuthSucceed(
      AuthSucceedEvent event, Emitter<AuthBlocState> emit) async {
    try {
      emit(AuthBlocState(status: AuthBlocStatus.loggedIn));
    } catch (e) {
      emit(AuthBlocState(status: AuthBlocStatus.failure));
    }
  }

  Future onAuthFailed(
      AuthFailedEvent event, Emitter<AuthBlocState> emit) async {
    try {
      emit(AuthBlocState(status: AuthBlocStatus.failure));
    } catch (e) {
      print('Error onAuthFailed: $e');
      emit(AuthBlocState(status: AuthBlocStatus.failure));
    }
  }
}
