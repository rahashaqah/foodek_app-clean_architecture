import '../../domain/entity/register_entity.dart';

class RegisterModel extends RegisterEntity {
  RegisterModel({
    required super.name,
    required super.email,
    required super.birth_date,
    required super.phone_number,
    required super.password,
    this.token,
  });

  final String? token;

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      name: json['name'],
      email: json['email'],
      birth_date: json['birth_date'],
      phone_number: json['phone_number'],
      password: json['password'],
      token: json['data']['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'birth_date': birth_date,
      'phone_number': phone_number,
      'password': password,
    };
  }
}
