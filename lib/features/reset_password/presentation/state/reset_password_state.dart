
import '../../data/model/otp_response_model.dart';

abstract class ResetPasswordState {}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordLoading extends ResetPasswordState {}

class SendOTPSuccess extends ResetPasswordState {
  final OTPResponseModel response;
  SendOTPSuccess(this.response);
}

class VerifyOTPSuccess extends ResetPasswordState {
  final OTPResponseModel response;
  VerifyOTPSuccess(this.response);
}

class ResetPasswordFailure extends ResetPasswordState {
  final String error;
  ResetPasswordFailure(this.error);
}
