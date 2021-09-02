import 'package:chat_bot/API/message.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'connection.dart';
import 'connection_laravel.dart';
//import 'package:flutter_link_previewer/flutter_link_previewer.dart';
import 'dart:convert';

class CALL {
  static Future<message> SEND_MESSAGE(String set_message) async {
    //print(connection.send_messsage_URL(set_message));
    var response = await http.get(connection.send_messsage_URL(set_message));
    if (response.statusCode == 200) {
      String bot_back_msg = response.body.toString();
      print("bot_back_msg");
      print(bot_back_msg);
      print("bot_back_msg");
      return new message(
          botMessage: bot_back_msg ?? '',
          messageColor: Colors.blue,
          messageType: "reciever");
    } else {
      return new message(
          botMessage: "failed",
          messageColor: Colors.black,
          messageType: "reciever"
          //"images/chatbot.jpeg"
          );
    }
  }

//academic
  static List<Messages> academicMessageList = [];

  static Future<Widget> messagesWithAcademic(
      String set_academic_message) async {
    // var msg = await SEND_Academic_MESSAGE(set_academic_message);
    // print(msg);

    //print(connection.send_messsage_URL(set_message));
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("token");

    var response = await http.get(
      connection_laravel.messagesWithAcademic(),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    List msgs = [];
    // print(response.statusCode);
    if (response.statusCode == 400) {
      var academic_back_msg = response.body;
      print(academic_back_msg);
      var jsonData = jsonDecode(academic_back_msg);
      var data = jsonData["messages"];

      //  var d= jsonDecode(data)  print(" :"+ m.message);
      List<Messages> messageList =
          List<Messages>.from(data.map((message) => Messages.fromJson(message)))
              .toList();
      data.map((m) => msgs.add(Messages.fromJson(m))).toList();
      print(
          " acacmedic message is msg[0] " + messageList[0].message.toString());
      // print(academic_back_msg);
      Messages result;
      if (academicMessageList.isEmpty) {
        academicMessageList = [...messageList];
        return null;
      }
      if (academicMessageList.isNotEmpty && messageList[0].sender != "user")
        result = academicMessageList.firstWhere(
            (messageAcademic) => messageAcademic.id == messageList[0].id,
            orElse: () => Messages.empty());
      else
        result = Messages.empty();
      if (result.id == -1) {
        if (messageList[0].sender != "user") {
          Messages temp = (messageList[0]);
          academicMessageList.add(temp);

          return (temp.message == null)
              ? messageAcademic.file(
                  temp.file.replaceFirst("localhost:8000", "192.168.43.136:8000"),
                  Colors.blue,
                  "reciever",
                  ValueKey(temp.file))
              : messageAcademic(temp.message, Colors.blue, "reciever",
                  ValueKey(temp.message));
        }
        // if(messageList[0].sender!="user") {
        //   Messages temp=(messageList[0]);
        //   academicMessageList.add(temp);
        //
        //   return(temp.message == null)?
        //   messageAcademic.file(
        //     temp.file.replaceFirst("localhost:8000", "192.168.1.10:8000"), Colors.blue, "reciever",
        //       ValueKey(temp.file)
        //   );
        //
        //   messageAcademic(
        //     temp.message, Colors.blue, "reciever",
        //       ValueKey(temp.message)
        //   );
        // }

      }

      return null;
      //print(bot_back_msg);
    } else {
      return new messageAcademic("failed", Colors.red, "reciever", UniqueKey()
          //"images/chatbot.jpeg"
          );
    }
  }

  //

  //
  static Future<Widget> SEND_Academic_MESSAGE(
      String set_academic_message) async {
    //print(connection.send_messsage_URL(set_message));
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("token");

    var response =
        await http.post(connection_laravel.sendMessageToAcademic(), headers: {
      'Authorization': 'Bearer $token',
    }, body: {
      "message": set_academic_message
    });

    if (response.statusCode == 400) {
      String academic_back_msg = response.body.toString();
      return null; // new messageAcademic(academic_back_msg, Colors.blue, "reciever",ValueKey(academic_back_msg)
      //"images/chatbot.jpeg"

      //print(bot_back_msg);
    } else {
      print("sending message  failed " + set_academic_message);
      return new messageAcademic("failed", Colors.red, "sender", UniqueKey()
          //"images/chatbot.jpeg"
          );
    }
  }

  //clerk

//
  static List<Messages> clerkMessageList = [];

  static Future<Widget> messagesWithClerk(String set_clerk_message) async {
    // var msg = await SEND_Academic_MESSAGE(set_academic_message);
    // print(msg);

    //print(connection.send_messsage_URL(set_message));
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("token");

    var response = await http.get(
      connection_laravel.messagesWithClerk(),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    List msggs = [];
    // print(response.statusCode);
    if (response.statusCode == 400) {
      var clerk_back_msg = response.body;
      print("clerk_back_msg");
      print(clerk_back_msg);
      print("clerk_back_msg");
      var jsonData = jsonDecode(clerk_back_msg);
      var data = jsonData["messages"];

      //  var d= jsonDecode(data)  print(" :"+ m.message);
      List<Messages> messageListt =
          List<Messages>.from(data.map((message) => Messages.fromJson(message)))
              .toList();
      data.map((m) => msggs.add(Messages.fromJson(m))).toList();
      print(" clerk message is msg[0] " + messageListt[0].message.toString());
      // print(academic_back_msg);
      Messages result;
      if (clerkMessageList.isEmpty) {
        clerkMessageList = [...messageListt];
        return null;
      }
      if (clerkMessageList.isNotEmpty && messageListt[0].sender != "user")
        result = clerkMessageList.firstWhere(
            (messageClerk) => messageClerk.id == messageListt[0].id,
            orElse: () => Messages.empty());
      else
        result = Messages.empty();
      if (result.id == -1) {
        if (messageListt[0].sender != "user") {
          Messages temp = (messageListt[0]);
          clerkMessageList.add(temp);

          return (temp.message == null)
          //place of file
              ? messageClerk.file(
                  temp.file.replaceFirst("localhost:8000", "192.168.43.136:8000"),
                  Colors.blue,
                  "reciever",
                  ValueKey(temp.file))
              : messageClerk(
              clerk_message: temp.message,
              message_colorr: Colors.blue,
                  messageType: "reciever",
                  key: ValueKey(temp.message));
        }
      }

      return null;
      //print(bot_back_msg);
    } else {
      return new messageClerk(
          clerk_message: "failed",
          message_colorr: Colors.red,
          messageType: "reciever",
          key: UniqueKey()
          //"images/chatbot.jpeg"
          );
    }
  }

  //

  //
  static Future<Widget> SEND_Clerk_MESSAGE(String set_clerk_message) async {
    //print(connection.send_messsage_URL(set_message));
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("token");

    var response =
        await http.post(connection_laravel.sendMessageToClerk(), headers: {
      'Authorization': 'Bearer $token',
    }, body: {
      "message": set_clerk_message
    });

    if (response.statusCode == 400) {
      String clerk_back_msg = response.body.toString();
      return null;
      // new messageClerk(academic_back_msg, Colors.blue, "reciever",ValueKey(academic_back_msg)
      //"images/chatbot.jpeg"

      //print(bot_back_msg);
    } else {
      print("sending message  failed " + set_clerk_message);

      return new messageClerk(
          clerk_message: "failed",
          message_colorr: Colors.red,
          messageType: "sender",
          key: UniqueKey()
          //"images/chatbot.jpeg"
          );
    }
  }
}
