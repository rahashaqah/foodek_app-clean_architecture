import '../../domain/entity/item_entity.dart';

abstract class GetAllItemState {}

class GetAllItemStateLoading extends GetAllItemState {}

class GetAllItemStateLoaded extends GetAllItemState {
  List<ItemEntity> items;

  GetAllItemStateLoaded(this.items);
}

class GetAllItemStateError extends GetAllItemState {
  String message;

  GetAllItemStateError(this.message);
}

class GetAllItemStateIntl extends GetAllItemState {}
