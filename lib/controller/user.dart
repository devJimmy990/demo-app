import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/data/model/user.dart';

class UserController extends ChangeNotifier {
  UserModel? _user;
  late FirebaseAuth _auth;
  late FirebaseFirestore _database;

  UserController() {
    _auth = FirebaseAuth.instance;
    _database = FirebaseFirestore.instance;
  }

  set value(UserModel? user) {
    _user = user;
    notifyListeners();
  }

  UserModel? get user => _user;

  Future<void> login(UserModel user) async {
    try {
      await _auth
          .signInWithEmailAndPassword(
              email: user.email, password: user.password)
          .then((result) {
        if (result.user != null) {
          _fetchUserData(result.user!.uid);
        }
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    value = null;
  }

  Future<void> createUser(UserModel user) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
              email: user.email, password: user.password)
          .then((result) {
        if (result.user != null) {
          _setUserData(result.user!.uid, user);
        }
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _fetchUserData(String uid) async {
    await _database.collection("users").doc(uid).get().then((result) {
      if (result.exists) {
        var data = result.data()!;
        data.addAll({"id": uid});
        _user = UserModel.fromJson(data);
        notifyListeners();
      }
    });
  }

  Future<void> _setUserData(String uid, UserModel user) async =>
      await _database.collection("users").doc(uid).set(user.toJson());
}
