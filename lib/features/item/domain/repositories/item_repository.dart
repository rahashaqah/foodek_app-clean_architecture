import '../entity/item_entity.dart';

abstract class ItemRepository {
  Future<List<ItemEntity>> getAll();
}
