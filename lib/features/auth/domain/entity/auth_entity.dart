import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? password;

  const UserModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.password,
  }
      );

  @override
  List<Object?> get props => [id, name, email,phone, password];
}
