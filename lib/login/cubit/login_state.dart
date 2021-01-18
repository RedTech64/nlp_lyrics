part of 'login_cubit.dart';

enum LoginStatus {
  /// The form has not been submitted yet
  unsubmitted,

  /// The form is in the process of being submitted.
  submissionInProgress,

  /// The form has been submitted successfully.
  submissionSuccess,

  /// The form submission failed.
  submissionFailure
}

class LoginState extends Equatable {
  const LoginState({
    this.status = LoginStatus.unsubmitted,
  });

  final LoginStatus status;

  @override
  List<Object> get props => [status];

  LoginState copyWith({
    LoginStatus status,
  }) {
    return LoginState(
      status: status ?? this.status,
    );
  }
}
