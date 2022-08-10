import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends Equatable {
  String id;
  String name;
  String email;
  String hobby;
  String balance;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      this.hobby = '',
      this.balance = '280000000'});

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, email, hobby, balance];
}
