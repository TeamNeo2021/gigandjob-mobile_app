import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'authbloc_event.dart';
part 'authbloc_state.dart';

class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  AuthBloc() : super(AuthblocInitial()) {
    // on<AuthblocEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
    on<AuthSucceedEvent>(onAuthSucceed);
    on<AuthFailedEvent>(onAuthFailed);
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
