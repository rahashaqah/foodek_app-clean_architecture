import '../../domain/entity/login_entity.dart';
import '../../domain/repositories/login_repository.dart';
import '../data_source/login_data_source.dart';

class LoginRepositoryImp extends LoginRepository {
  LoginRemoteDataSource loginRemoteDataSource;

  LoginRepositoryImp({required this.loginRemoteDataSource});

  @override
  Future<List<LoginEntity>> login() {
    return loginRemoteDataSource.login();
  }
}
