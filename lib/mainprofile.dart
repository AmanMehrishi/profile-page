import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:task1/user.dart';
import 'package:task1/edit.dart';
import 'package:task1/userpreferences.dart';
import 'package:task1/appbar_widget.dart';
import 'package:task1/button_widget.dart';

import 'package:task1/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    // UserPreferences.setUser(UserPreferences.myUser);UserPreferences.setUser(UserPreferences.myUser);
    final user = UserPreferences.getUser();

    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) => Scaffold(
          appBar: buildAppBar(context),
          body: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              ProfileWidget(
                imagePath: user.imagePath,
                onClicked: () async {
                  await Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditProfilePage()),
                  );
                  setState(() {});
                },
              ),
              const SizedBox(height: 24),
              buildName(user),

              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfilePage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                  ), child: Text('Edit Profile'),
              ),

              const SizedBox(height: 24,),
              buildInterest1(user),
              const SizedBox(height: 24,),
              buildInterest2(user),
              const SizedBox(height: 24,),
              buildInterest3(user),
              const SizedBox(height: 48),
              buildAbout(user),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildName(User user) => Column(
    children: [
      Text(
        user.name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
      const SizedBox(height: 4),

    ],
  );

  Widget buildInterest1(User user) => Column(
    children: [
      Text(
        user.int1,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
      const SizedBox(height: 4),

    ],
  );

  Widget buildInterest2(User user) => Column(
    children: [
      Text(
        user.int2,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
      const SizedBox(height: 4),

    ],
  );

  Widget buildInterest3(User user) => Column(
    children: [
      Text(
        user.int3,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
      const SizedBox(height: 4),

    ],
  );

  Widget buildAbout(User user) => Container(
    padding: EdgeInsets.symmetric(horizontal: 48),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Text(
          user.about,
          style: TextStyle(fontSize: 16, height: 1.4),
        ),
      ],
    ),
  );
}