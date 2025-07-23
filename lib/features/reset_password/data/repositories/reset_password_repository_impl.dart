import '../../domain/repositories/reset_password_repository.dart';
import '../data_source/reset_password_remote_data_source.dart';
import '../model/otp_response_model.dart';

class ResetPasswordRepositoryImpl implements ResetPasswordRepository {
  final ResetPasswordRemoteDataSource remoteDataSource;

  ResetPasswordRepositoryImpl({required this.remoteDataSource});

  @override
  Future<OTPResponseModel> sendOTP(String email) {
    return remoteDataSource.sendOTP(email);
  }

  @override
  Future<OTPResponseModel> verifyOTP(String email, String otp) {
    return remoteDataSource.verifyOTP(email, otp);
  }
}
