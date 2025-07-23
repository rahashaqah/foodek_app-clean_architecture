import '../../../../core/network/api_client.dart';
import '../model/otp_response_model.dart';

abstract class ResetPasswordRemoteDataSource {
  Future<OTPResponseModel> sendOTP(String email);
  Future<OTPResponseModel> verifyOTP(String email, String otp);
}

class ResetPasswordRemoteDataSourceImpl implements ResetPasswordRemoteDataSource {
  final ApiClient apiClient;

  ResetPasswordRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<OTPResponseModel> sendOTP(String email) async {
    final response = await apiClient.sendOTP(email: email);
    return OTPResponseModel.fromJson(response!);
  }

  @override
  Future<OTPResponseModel> verifyOTP(String email, String otp) async {
    final response = await apiClient.verifyOTP(email: email, otp: otp);
    return OTPResponseModel.fromJson(response!);
  }
}
