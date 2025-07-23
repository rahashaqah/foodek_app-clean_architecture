import '../../../../core/use_case/use_case.dart';
import '../entity/login_entity.dart';
import '../repositories/login_repository.dart';

class LoginUseCase implements UseCase<List<LoginEntity>, NoParams> {
  final LoginRepository repository;

  LoginUseCase({required this.repository});

  @override
  Future<List<LoginEntity>> call(NoParams params) {
    return repository.login();
  }
}
