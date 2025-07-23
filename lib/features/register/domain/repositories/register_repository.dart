import '../entity/register_entity.dart';

abstract class RegisterRepository {
  Future<RegisterEntity> signup({required Map<String, dynamic> body});
}
