abstract class LoginState {}

class LoginStateLoading extends LoginState {}

class LoginStateLoaded extends LoginState {
  final String token; // Optionally, include token data

  LoginStateLoaded({required this.token});
}

class LoginStateError extends LoginState {
  String message;

  LoginStateError(this.message);
}

class LoginStateIntl extends LoginState {}
