import '../../domain/entity/login_entity.dart';

class LoginModel extends LoginEntity {
  LoginModel({required super.email, required super.password});

  factory LoginModel.fromJson({required Map<String, dynamic> json}) {
    return LoginModel(email: json['email'], password: json['password']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
