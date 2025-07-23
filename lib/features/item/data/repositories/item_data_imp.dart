import '../../domain/entity/item_entity.dart';
import '../../domain/repositories/item_repository.dart';
import '../data_source/item_data_source.dart';

class ItemRepositoryImp extends ItemRepository {
  ItemRemoteDataSource postRemoteDataSource;

  ItemRepositoryImp({required this.postRemoteDataSource});

  @override
  Future<List<ItemEntity>> getAll() {
    return postRemoteDataSource.getAll();
  }
}
