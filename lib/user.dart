import 'package:flutter/material.dart';

class User
{
  final String name;
  final String about;
  final String int1 ;
  final String int2;
  final String int3;
  final bool isDarkMode;
  final String imagePath;

  const User({
    required this.name,
    required this.about,
    required this.int1,
    required this.int2,
    required this.int3,
    required this.isDarkMode,
    required this.imagePath,
});

  User copy({
    String? name,
    String? about,
    String? int1,
    String? int2,
    String? int3,
    bool? isDarkMode,
    String? imagePath,
}) => User(
    name: name ?? this.name,
    about: about ?? this.about,
    int1: int1 ?? this.int1,
    int2: int2 ?? this.int2,
    int3: int3 ?? this.int3,
    isDarkMode: isDarkMode ?? this.isDarkMode,
    imagePath: imagePath ?? this.imagePath,
  );

  static User fromJson(Map<String,dynamic> json) {
    // print('name ${json['name']}');
    // print('about ${json['about']}');
    // print('int1 ${json['int1']}');
    // print('int2 ${json['int2']}');
    // print('int3 ${json['int3']}');
    // print('isDarkMode ${json['isDarkMode']}');
    // print('imagePath ${json['imagePath']}');
    // print(json);

    return User(
      name: json['name'],
      about: json['about'],
      int1:  json['int1'],
      int2:  json['int2'],
      int3:  json['int3'],
      isDarkMode: json['isDarkMode'],
      imagePath: json['imagePath'],
    );
  }

  Map<String, dynamic> toJson() => {
       'name': name,
       'about': about,
       'int1': int1,
       'int2': int2,
       'int3': int3,
       'isDarkMode': isDarkMode,
       'imagePath': imagePath,
  };

}

