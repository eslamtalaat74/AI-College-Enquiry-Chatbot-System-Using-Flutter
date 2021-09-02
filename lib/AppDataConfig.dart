import 'dart:io';

import 'package:chat_bot/Theme/AppTheme.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDataConfig
{
  static Future<void> loadColor () async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String color = prefs.getString('themeColor') ?? "blue";
    AppTheme.setColor(color);
  }

  static Future<String> getFilePath() async {
    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
    String appDocumentsPath = appDocumentsDirectory.path;
    String filePath = '$appDocumentsPath/background.png';

    return filePath;
  }

  static void saveFile(File pickedFile) async
  {
    File file = await pickedFile.copy(await getFilePath());
  }

}