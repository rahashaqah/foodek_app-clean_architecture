import '../entity/otp_response.dart';

abstract class ResetPasswordRepository {
  Future<OTPResponse> sendOTP(String email);
  Future<OTPResponse> verifyOTP(String email, String otp);
}
