import 'package:airplane_app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  var _service = FirebaseFirestore.instance.collection('users');

  Future<void> userService(UserModel usersModel) async {
    try {
      _service.doc(usersModel.id).set(
        {
          'name': usersModel.name,
          'email': usersModel.email,
          'hobby': usersModel.hobby,
          'balace': usersModel.balance
        },
      );
    } catch (e) {
      throw e;
    }
  }

  Future<UserModel> getId(String id) async {
    try {
      DocumentSnapshot documentSnapshot = await _service.doc(id).get();
      UserModel userModel = UserModel(
          id: id,
          name: documentSnapshot['name'],
          email: documentSnapshot['email'],
          hobby: documentSnapshot['hobby'],
          balance: documentSnapshot['balace']);

      return userModel;
    } catch (e) {
      throw e;
    }
  }
}
