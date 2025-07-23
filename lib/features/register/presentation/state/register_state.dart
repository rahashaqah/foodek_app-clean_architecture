import '../../domain/entity/register_entity.dart';

abstract class RegisterState {}

class RegisterStateIntl extends RegisterState {}

class RegisterStateLoading extends RegisterState {}

class RegisterStateLoaded extends RegisterState {
  final RegisterEntity data;

  RegisterStateLoaded({required this.data});
}

class RegisterStateError extends RegisterState {
  final String message;

  RegisterStateError(this.message);
}
