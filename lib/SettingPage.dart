import 'dart:io';

import 'package:chat_bot/AppDataConfig.dart';
import 'package:chat_bot/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'Theme/AppTheme.dart';

class SettingPagee extends StatefulWidget {
  HomeScreenState parent;

  SettingPagee({this.parent});

  @override
  State<StatefulWidget> createState() => SettingPageState();
}

class SettingPageState extends State<SettingPagee> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Center(
            child: Text(
              "Select Your Mode....",
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height / 50 * 32 /* * 0.56 */,
          child: GridView.builder(
              physics: new NeverScrollableScrollPhysics(),
              itemCount: AppTheme.colors.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    changeTheme(index);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppTheme.colors[index]),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                );
              }),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        InkWell(
          onTap: () {
            pickImage();
          },
          // child: Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Row(
          //     children: <Widget>[
          //       Text("Wallpaper"),
          //       SizedBox(
          //         width: MediaQuery.of(context).size.width * 0.04,
          //       ),
          //       Icon(Icons.wallpaper, color: AppTheme.mainColor)
          //     ],
          //   ),
          // ),
        ),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Row(children: <Widget>[
        //     Text("Notification"),
        //     SizedBox(
        //       width: MediaQuery.of(context).size.width * 0.04,
        //     ),
        //     Radio(value: false, groupValue: null, onChanged: (val) {}),
        //     Text("Mute"),
        //     SizedBox(
        //       width: MediaQuery.of(context).size.width * 0.04,
        //     ),
        //     Radio(value: false, groupValue: null, onChanged: (val) {}),
        //     Text("UnMute"),
        //   ]),
        // ),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Row(children: <Widget>[
        //     Text("FontSize"),
        //     SizedBox(
        //       width: MediaQuery.of(context).size.width * 0.04,
        //     ),
        //     Container(
        //         decoration:
        //             BoxDecoration(border: Border.all(color: Colors.grey)),
        //         child: Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Text("14 Sp"),
        //         )),
        //   ]),
        // ),
      ],
    );
  }

  void changeTheme(int index) {
    setState(() {
      AppTheme.setColor(AppTheme.colorsNames[index]);
    });

    widget.parent.refresh();
  }

  void pickImage() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      AppDataConfig.saveFile(File(pickedFile.path));
      AppTheme.bacgroundImagePath = pickedFile.path;
    }

    widget.parent.refresh();
  }
}
