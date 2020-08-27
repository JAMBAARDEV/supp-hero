import 'dart:async';
import 'package:flutter/material.dart';
import 'package:supply_hero_web/shared/constants.dart';
import '../models/models.dart';

class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();
  UserModel _user = UserModel();
  UserModel get user => _user;

  Future<bool> login(UserModel user) {
    if (user.email == SUPPLIER_EMAIL || user.email == RESTAURANT_EMAIL &&  user.password == PWD  ) {
      _user = user;
      return Future.value(true);
    }
    return Future.value(false);
  }

  Future<bool> logout(BuildContext context) {
    _user = null;
  }
}
