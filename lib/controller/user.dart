import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_app/core/features/biometric.dart';
import 'package:demo_app/core/shared_preference.dart';
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
    String? user = SharedPreference.getString(key: "user");
    if (user != null) {
      _fetchUserData(user);
    }
  }

  set value(UserModel? user) {
    _user = user;
    notifyListeners();
  }

  UserModel? get user => _user;
  List<String> get images => _user?.images ?? [];

  Future<void> loginWithEmailAndPassword(UserModel user) async {
    try {
      await _auth
          .signInWithEmailAndPassword(
              email: user.email, password: user.password)
          .then((result) {
        if (result.user != null) {
          _cacheUserData(uid: result.user!.uid, user: user);
          _fetchUserData(result.user!.uid);
        }
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> loginWithBiometric() async {
    try {
      Map<String, dynamic>? credential =
          jsonDecode(SharedPreference.getString(key: "credential")!);
      if (credential == null) return;
      final String email = credential["email"]!;
      final String password = credential["password"]!;
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
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
    SharedPreference.setBool(key: "auth", value: false);
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

  void _cacheUserData({required String uid, required UserModel user}) {
    final Map<String, dynamic> credential = {
      "email": user.email,
      "password": user.password
    };
    SharedPreference.setBool(key: "auth", value: true);
    SharedPreference.setString(key: "uid", value: uid);
    SharedPreference.setString(
        key: "credential", value: jsonEncode(credential));
    Biometric.checkBiometricAvailability();
  }

  addUserImages(File file) {
    _user?.addUserImage(file.path);
    notifyListeners();
  }

  Future<void> _setUserData(String uid, UserModel user) async =>
      await _database.collection("users").doc(uid).set(user.toJson());
}
