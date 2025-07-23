import '../../domain/entity/register_entity.dart';
import '../../domain/repositories/register_repository.dart';
import '../data_source/register_data_source.dart';

class RegisterRepositoryImp extends RegisterRepository {
  RegisterRemoteDataSource registerRemoteDataSource;

  RegisterRepositoryImp({required this.registerRemoteDataSource});

  @override
  Future<RegisterEntity> signup({required Map<String, dynamic> body}) {
    return registerRemoteDataSource.signup(body: body);
  }
}
