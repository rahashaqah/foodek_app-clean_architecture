import '../../domain/entity/otp_response.dart';

class OTPResponseModel extends OTPResponse {
  OTPResponseModel({
    required bool isSuccess,
    required String message,
  }) : super(isSuccess: isSuccess, message: message);

  factory OTPResponseModel.fromJson(Map<String, dynamic> json) {
    return OTPResponseModel(
      isSuccess: json['isSuccess'] ?? false,
      message: json['message'] ?? '',
    );
  }
}
