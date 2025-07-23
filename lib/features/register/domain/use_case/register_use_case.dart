import '../../../../core/use_case/use_case.dart';
import '../entity/register_entity.dart';
import '../repositories/register_repository.dart';

class RegisterUseCase implements UseCase<RegisterEntity, MapParams> {
  final RegisterRepository repository;

  RegisterUseCase({required this.repository});

  @override
  Future<RegisterEntity> call(MapParams params) {
    return repository.signup(body: params.map);
  }
}
