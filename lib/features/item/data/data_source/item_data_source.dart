import '../../../../core/network/api_client.dart';
import '../../domain/entity/item_entity.dart';
import '../model/item_model.dart';

abstract class ItemDataSource {
  Future<List<ItemEntity>> getAll();
}

class ItemRemoteDataSource extends ItemDataSource {
  @override
  Future<List<ItemEntity>> getAll() async {
    final response = await ApiClient.getDataList(
      endpoint: "posts",
      fromJsonT: (data) => ItemModel.fromJson(json: data),
    );
    return response;
  }
}
