import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppTheme
{

  static List<Color> colors = [
    Colors.red, // 0
    Colors.black, // 1
    Colors.blue, // 2
    Colors.yellow, // 3
  ];

  static List<String> colorsNames = [
    "red", // 0
    "black", // 1
    "blue", // 2
    "yellow", // 3
  ];

  static String _colorName = "blue";

  static Color mainColor = Colors.black;

  static String bacgroundImagePath = "";

  static setColor (String cName)
  {
    _colorName = cName;
    _applyColor(cName);
  }

  static _applyColor (String cName)
  {
    switch (cName) {
      case "blue":
        mainColor = Colors.blue;
        break;

      case "black":
        mainColor = Colors.black;
        break;

      case "red":
        mainColor = Colors.red;
        break;

      case "yellow":
        mainColor = Colors.yellow;
        break;

      default:
        mainColor = Colors.blue;
        break;
    }

    _saveColor(cName);

  }

  static _saveColor(String cName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('themeColor', cName);
  }

}