import 'package:airplane_app/cubit/auth_state.dart';
import 'package:airplane_app/models/user_model.dart';
import 'package:airplane_app/services/user_auth.dart';
import 'package:airplane_app/services/user_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  // NOTE: SignUp
  void signUp(
      {required String name,
      required String email,
      required String password,
      String hobby = '',
      String balance = '280000000'}) async {
    try {
      emit(AuthLoading());
      var data = await UserAuth().authUser(name, email, password, hobby);
      emit(AuthSucces(data));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  // NOTE: Logout
  void logout() async {
    try {
      emit(AuthLoading());
      await UserAuth().signOut();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  // NOTE: AmbilData Dari Id
  void setUserByData(String id) async {
    try {
      UserModel value = await UserService().getId(id);
      emit(AuthSucces(value));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  // NOTE: SignIn
  void signIn({required String email, required String password}) async {
    try {
      emit(AuthLoading());
      UserModel userModel =
          await UserAuth().signIn(email: email, password: password);
      emit(AuthSucces(userModel));
    } catch (e) {
      AuthError(e.toString());
    }
  }
}
