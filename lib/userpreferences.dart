import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task1/user.dart';


class UserPreferences {

  static late SharedPreferences _preferences;
  static const _keyUser = 'user';
  static const myUser = User(

    name: 'Aman Mehrishi',
    about:
    'Certified Personal Trainer and Nutritionist with years of experience in creating effective diets and training plans focused on achieving individual customers goals in a smooth way.',
    int1: 'Interest 1',
    int2: 'Interest 2',
    int3: 'Interest 3',
    isDarkMode: false,
    imagePath: 'image/propic.png',
  );

  static Future init() async => _preferences = await SharedPreferences.getInstance();

  static Future setUser(User user) async {
    final json = jsonEncode(user.toJson());
    print(jsonDecode(json));
    await _preferences.setString(_keyUser, json);
  }

  static User getUser()
  {
    final json = _preferences.getString(_keyUser);
    return User.fromJson(jsonDecode(json!));
  }
}