import 'package:equatable/equatable.dart';
import 'package:http/http.dart';

abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}

abstract class NullableUseCase<Type, Params> {
  Future<Type?> nullableCall(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

class StringParams extends Equatable {
  final String value;

  const StringParams({required this.value});

  @override
  List<Object> get props => [value];
}

class IntParams extends Equatable {
  final int value;

  const IntParams({required this.value});

  @override
  List<Object> get props => [value];
}

class MapParams extends Equatable {
  final Map<String, dynamic> map;

  const MapParams({required this.map});

  @override
  List<Object> get props => [map];
}

class MultipartParams extends Equatable {
  final List<MultipartFile> files;
  final Map<String, dynamic> fields;

  const MultipartParams({required this.files, required this.fields});

  @override
  List<Object> get props => [fields, files];
}
