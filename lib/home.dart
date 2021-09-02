import 'package:chat_bot/AboutPage.dart';
import 'package:chat_bot/AcademicAdvisor.dart';
import 'package:chat_bot/ChatPage.dart';
import 'package:chat_bot/GalleryPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'API/CALL.dart';
import 'API/message.dart';
import 'Clerk.dart';
import 'package:chat_bot/Clerk.dart';
import 'feedback.dart';
import 'package:chat_bot/ProfilePage.dart';
import 'package:chat_bot/SettingPage.dart';
import 'package:chat_bot/Theme/AppTheme.dart';
import 'package:flutter/material.dart';

import 'help.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int index = 0;
  List<Widget> widgets;
  messageClerk m1 = new messageClerk();

  // CALL b = new CALL();

  HomeScreenState() {
    widgets = [
      ChatPage(),
      AboutPage(),
      GalleryPage(),
      SettingPagee(parent: this),
      feedback(),
      ProfilePage(),
      clerk(),
      AcademicAdvisor()
    ];
  }

// message message1 = new message();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: index == 0
            ? null
            : AppBar(
                backgroundColor: AppTheme.mainColor,
                centerTitle: true,
                leading: Container(),
                title: Text("ChatBot"),
                actions: [
                    IconButton(
                      icon: Icon(Icons.help),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Help()));
                      },
                    ),


                    IconButton(
                      icon: Icon(Icons.chat),
                      onPressed: (m1.clerk_message == "hi")
                          ? () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => AcademicAdvisor()));
                            }
                          : null,
//bot_message
                    ),
                  ]),
        //BottomNavigation
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: index,
            onTap: (currentindex) {
              setState(() {
                index = currentindex;
                print(currentindex);
              });
            },
            items: [
              BottomNavigationBarItem(
                  backgroundColor: Colors.black,
                  icon: Icon(Icons.chat_bubble, color: AppTheme.mainColor),
                  title: Text("Home")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.info, color: AppTheme.mainColor),
                  title: Text("About")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.image, color: AppTheme.mainColor),
                  title: Text("Gallery")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings, color: AppTheme.mainColor),
                  title: Text("Themes")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.feedback, color: AppTheme.mainColor),
                  title: Text("feedback")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person, color: AppTheme.mainColor),
                  title: Text("Profile")),
            ]),

        body: widgets[index],
      ),
    );
  }

  void refresh() {
    setState(() {});
  }
}
