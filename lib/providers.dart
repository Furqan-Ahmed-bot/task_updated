// ignore_for_file: unused_field, prefer_final_fields


import 'package:flutter/material.dart';

class UserPovider extends ChangeNotifier {

   List _rolesData = [];
   List<dynamic> get rolesData => _rolesData;

   Future<void> setRolesData(rolesData) async {
    _rolesData = await rolesData;
    notifyListeners();
  }

 
 }

