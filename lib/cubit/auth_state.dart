import 'package:airplane_app/models/user_model.dart';
import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSucces extends AuthState {
  UserModel userModel;
  AuthSucces(this.userModel);

  @override
  // TODO: implement props
  List<Object?> get props => [userModel];
}

class AuthError extends AuthState {
  String error;
  AuthError(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
