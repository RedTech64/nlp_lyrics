import 'dart:io';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authenticationRepository)
      : assert(_authenticationRepository != null),
        super(const LoginState());

  final AuthenticationRepository _authenticationRepository;

  Future<void> logInWithGoogle() async {
    emit(state.copyWith(status: LoginStatus.submissionInProgress));
    try {
      await _authenticationRepository.logInWithGoogle();
      emit(state.copyWith(status: LoginStatus.submissionSuccess));
    } on Exception {
      emit(state.copyWith(status: LoginStatus.submissionFailure));
    } on NoSuchMethodError {
      emit(state.copyWith(status: LoginStatus.submissionFailure));
    }
  }

  Future<void> logInWithApple(Platform platform) async {
    emit(state.copyWith(status: LoginStatus.submissionInProgress));
    try {
      await _authenticationRepository.logInWithApple(platform);
      emit(state.copyWith(status: LoginStatus.submissionSuccess));
    } on Exception {
      emit(state.copyWith(status: LoginStatus.submissionFailure));
    } on NoSuchMethodError {
      emit(state.copyWith(status: LoginStatus.submissionFailure));
    }
  }
}
