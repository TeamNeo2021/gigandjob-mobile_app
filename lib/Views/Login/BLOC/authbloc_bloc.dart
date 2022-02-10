import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gigandjob_mobile_app/Dominio/Repositories/AuthRepository.dart';
import 'package:gigandjob_mobile_app/Dominio/Services/AuthService.dart';
import 'package:meta/meta.dart';

part 'authbloc_event.dart';
part 'authbloc_state.dart';

class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  final AuthRepository authRepository;

  AuthBloc({
    required this.authRepository,
  }) : super(AuthblocInitial()) {
    // on<AuthblocEvent>((event, emit) {
    //   // TODO: implement event handler
    // });

    on<AuthSucceedEvent>(onAuthSucceed);
    on<AuthOnLoginEvent>(onAuthOnLoginEvent);
    on<AuthFailedEvent>(onAuthFailed);
  }

  Future onAuthOnLoginEvent(
      AuthOnLoginEvent event, Emitter<AuthBlocState> emit) async {
    print('ON AUTH LOGIN EVENT');
    try {
      final response = await this
          .authRepository
          .login(new AuthEntity(email: event.email, password: event.password));
      print('onAuthOnLoginEvent response: $response');
      if (response) {
        return emit(AuthBlocState(status: AuthBlocStatus.loggedIn));
      } else {
        return emit(AuthBlocState(status: AuthBlocStatus.failure));
      }
    } catch (e) {
      return emit(AuthBlocState(status: AuthBlocStatus.failure));
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
