import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/use_case/use_case.dart';
import '../../domain/use_case/get_all_use_case.dart';
import '../state/get_all_item_state.dart';

class GetAllItemCubit extends Cubit<GetAllItemState> {
  GetAllUseCase getAllUseCase;

  GetAllItemCubit({required this.getAllUseCase}) : super(GetAllItemStateIntl());

  getAllItems() {
    emit(GetAllItemStateLoading());

    getAllUseCase
        .call(NoParams())
        .then(
          (value) {
            emit(GetAllItemStateLoaded(value));
          },
          onError: (error) {
            emit(GetAllItemStateError(error.toString()));
          },
        );
  }
}
