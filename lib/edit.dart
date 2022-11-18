import 'dart:io';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:task1/user.dart';
import 'package:task1/userpreferences.dart';
import 'package:task1/appbar_widget.dart';
import 'package:task1/button_widget.dart';
import 'package:task1/profile_widget.dart';
import 'package:task1/textfield_widget.dart';
import 'package:path/path.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late User user;

  @override
  void initState() {
    super.initState();

    user = UserPreferences.getUser();
  }

  @override
  Widget build(BuildContext context) => ThemeSwitchingArea(
    child: Builder(
      builder: (context) => Scaffold(
        appBar: buildAppBar(context),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 32),
          physics: BouncingScrollPhysics(),
          children: [
            ProfileWidget(
              imagePath: user.imagePath,
              isEdit: true,
              onClicked: () async {
                final image = await ImagePicker()
                    .pickImage(source: ImageSource.gallery);

                if (image == null) return;

                final directory = await getApplicationDocumentsDirectory();
                final name = basename(image.path);
                final imageFile = File('${directory.path}/$name');
                final newImage =
                await File(image.path).copy(imageFile.path);

                setState(() => user = user.copy(imagePath: newImage.path));
              },
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Full Name',
              text: user.name,
              onChanged: (name) => setState(() {
                user = user.copy(name: name);
              }),
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Interest 1',
              text: user.int1,
              onChanged: (int1) => setState(() {
                user = user.copy(int1: int1);
              }),
            ),
            const SizedBox(height: 24,),
            TextFieldWidget(
              label: 'Interest 2',
              text: user.int2,
              onChanged: (int2) => user = user.copy(int2: int2),
            ),
            const SizedBox(height: 24,),
            TextFieldWidget(
              label: 'Interest 3',
              text: user.int3,
              onChanged: (int3) => user = user.copy(int3: int3),
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'About',
              text: user.about,
              maxLines: 5,
              onChanged: (about) => user = user.copy(about: about),
            ),
            const SizedBox(height: 24),
            ButtonWidget(
              text: 'Save',
              onClicked: () {
                UserPreferences.setUser(user);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    ),
  );
}