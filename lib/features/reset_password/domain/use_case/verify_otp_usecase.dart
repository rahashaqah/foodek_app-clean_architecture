
import '../entity/otp_response.dart';
import '../repositories/reset_password_repository.dart';

class SendOTPUseCase {
  final ResetPasswordRepository repository;

  SendOTPUseCase(this.repository);

  Future<OTPResponse> call(String email , String otp) {
    return repository.verifyOTP( email, otp);
  }
}
