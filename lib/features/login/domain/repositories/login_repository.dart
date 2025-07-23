import '../entity/login_entity.dart';

abstract class LoginRepository {
  Future<List<LoginEntity>> login();
}
