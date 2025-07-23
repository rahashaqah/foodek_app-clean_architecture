import '../../../../core/use_case/use_case.dart';
import '../entity/item_entity.dart';
import '../repositories/item_repository.dart';

class GetAllUseCase implements UseCase<List<ItemEntity>, NoParams> {
  final ItemRepository repository;

  GetAllUseCase({required this.repository});

  @override
  Future<List<ItemEntity>> call(NoParams params) {
    return repository.getAll();
  }
}
