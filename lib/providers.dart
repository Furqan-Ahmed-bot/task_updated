// ignore_for_file: unused_field, prefer_final_fields


import 'package:flutter/material.dart';

import 'models.dart';

class UserPovider extends ChangeNotifier {
  UserModel _user = UserModel(
      id: '',
      name: '',
      username: '',
      email: '',
      // address: '',
      phone: '',
      website: '');

      UserModel get user => _user;

      void setUser(user){
        _user = UserModel.fromJson(user);
        notifyListeners();

      }
}
