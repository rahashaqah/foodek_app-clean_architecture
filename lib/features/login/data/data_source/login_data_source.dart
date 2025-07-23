import '../../../../core/network/api_client.dart';
import '../../domain/entity/login_entity.dart';
import '../model/login_model.dart';

abstract class LoginDataSource {
  Future<List<LoginEntity>> login();
}

class LoginRemoteDataSource extends LoginDataSource {
  @override
  Future<List<LoginEntity>> login() async {
    final response = await ApiClient.postData(
      endpoint: "api/login", // Your login endpoint
      fromJsonT: (data) {
        return LoginModel.fromJson(json: data);
      },
      body: {'email': 'user@example.com', 'password': 'your_password'},
    );
    return [response];
  }
}
