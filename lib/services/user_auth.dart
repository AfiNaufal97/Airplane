import 'package:airplane_app/models/user_model.dart';
import 'package:airplane_app/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserAuth {
  FirebaseAuth _authUser = FirebaseAuth.instance;

  // NOTE: new account
  Future<UserModel> authUser(
      String name, String email, String password, String hobby) async {
    try {
      UserCredential userCredential = await _authUser
          .createUserWithEmailAndPassword(email: email, password: password);

      UserModel userModel = UserModel(
          id: userCredential.user!.uid,
          name: name,
          email: email,
          hobby: 'coding');

      await UserService().userService(userModel);

      return userModel;
    } catch (e) {
      throw e;
    }
  }

  // NOTE: SignOut
  Future<void> signOut() async {
    await _authUser.signOut();
  }

  // NOTE: SignIn
  Future<UserModel> signIn(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _authUser
          .signInWithEmailAndPassword(email: email, password: password);

      UserModel userModel = await UserService().getId(userCredential.user!.uid);
      return userModel;
    } catch (e) {
      throw e;
    }
  }
}
