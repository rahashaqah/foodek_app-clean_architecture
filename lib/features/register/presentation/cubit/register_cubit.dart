import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/use_case/use_case.dart';
import '../../data/model/register_model.dart';
import '../../domain/use_case/register_use_case.dart';
import '../state/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase registerUseCase;

  RegisterCubit({required this.registerUseCase}) : super(RegisterStateIntl());

  Future<void> register(RegisterModel registerModel) async {
    emit(RegisterStateLoading());

    try {
      final result = await registerUseCase.call(
        MapParams(map: registerModel.toJson()),
      );

      // You might want to check some fields in the RegisterEntity if needed
      emit(
        RegisterStateLoaded(data: result),
      ); // Optionally pass the result if needed
    } catch (e) {
      emit(RegisterStateError("Registration failed: ${e.toString()}"));
    }
  }
}
