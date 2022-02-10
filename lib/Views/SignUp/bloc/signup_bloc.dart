import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gigandjob_mobile_app/Dominio/Repositories/register_repository.dart';
import 'package:gigandjob_mobile_app/Dominio/Services/register_service.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final repo = RegisterService();
  SignupBloc() : super(SignupInitial()) {
    on<SignupEvent>((event, emit) {
      on<SignupSucceedEvent>(onSignupSucceed);
      on<SignupOnRegisterEvent>(onSignupOnRegisterEvent);
      on<SignupFailedEvent>(onSignupFailed);
    });
  }

  onSignupOnRegisterEvent(
      SignupOnRegisterEvent event, Emitter<SignupState> emit) async {
    print('AAAAAAAAAAAA');
    try {
      print('222222222222222');
      await repo.signup(RegisterEntity(
          email: event.email,
          password: event.password,
          bday: event.bday,
          lastname: event.lastname,
          latitude: event.latitude,
          longitud: event.longitud,
          name: event.name,
          phone: event.phone));
      emit(const SignupState(status: SignUpStatus.initial));
    } catch (e) {
      emit(const SignupState(status: SignUpStatus.failure));
    }
  }

  Future onSignupSucceed(
      SignupSucceedEvent event, Emitter<SignupState> emit) async {
    try {
      emit(const SignupState(status: SignUpStatus.register));
    } catch (e) {
      emit(const SignupState(status: SignUpStatus.failure));
    }
  }

  Future onSignupFailed(
      SignupFailedEvent event, Emitter<SignupState> emit) async {
    try {
      emit(const SignupState(status: SignUpStatus.failure));
    } catch (e) {
      emit(const SignupState(status: SignUpStatus.failure));
    }
  }
}
