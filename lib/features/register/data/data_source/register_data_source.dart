import '../../../../core/network/api_client.dart';
import '../../domain/entity/register_entity.dart';
import '../model/register_model.dart';

abstract class RegisterDataSource {
  Future<RegisterEntity> signup({required Map<String, dynamic> body});
}

class RegisterRemoteDataSource extends RegisterDataSource {
  @override
  Future<RegisterEntity> signup({required Map<String, dynamic> body}) async {
    final response = await ApiClient.postData(
      endpoint: "api/register",
      body: body,
      fromJsonT: (data) => RegisterModel.fromJson(body),
    );
    return response;
  }
}
