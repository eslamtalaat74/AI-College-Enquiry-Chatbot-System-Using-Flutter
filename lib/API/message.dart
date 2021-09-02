import 'package:chat_bot/network_utils/api.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../API/CALL.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

DateTime now = DateTime.now();
String bot_message;

String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);

class message extends StatelessWidget {
  String messageType;
  String botMessage;
  var messageColor;
  String pic = '';

  message({
    this.messageType,
    this.botMessage,
    this.messageColor,
  }); //String messageType;

  //Message({String incommingMessage, var color,String messageType})

/*{
    // this.pic = picture;
    this.bot_message = incommingMessage;
    this.message_color = color;
    this.messageType=messageType;
    // print("bot_message");
    // print(bot_message);
    // print("bot_message");
  }*/

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(top: 10, bottom: 10),
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Container(
              padding:
                  EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
              child: Align(
                alignment: (messageType == "sender"
                    ? Alignment.topLeft
                    : Alignment.topRight),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: messageColor,
                  ),
                  padding: EdgeInsets.all(16),
                  child: Text(
                    botMessage ?? '',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: width * 0.01,
            ),
            Align(
              alignment: (messageType == "sender"
                  ? Alignment.topLeft
                  : Alignment.topRight),
              child: Text(
                "sent at " + formattedDate ?? '',
                // textAlign: messageType == "sender"?TextAlign.right:TextAlign.left,

                style: TextStyle(color: Colors.grey, fontSize: 10),
              ),
            ),
          ]),
    );
  }
}

//academic

class messageAcademic extends StatelessWidget {
  String academic_message;
  var message_color;
  String url;
  String pic;
  String messageType;

  messageAcademic(
      String incommingg_message, var color, String messageType, Key key)
      : super(key: key) {
    // this.pic = picture;
    this.academic_message = incommingg_message;
    this.message_color = color;
    this.messageType = messageType;
  }

  messageAcademic.file(String url, var color, String messageType, Key key)
      : super(key: key) {
    // this.pic = picture;
    this.url = url;
    this.message_color = color;
    this.messageType = messageType;
  }

  messageAcademic.fromJson(Map<String, dynamic> json) {
    this.academic_message = json['incommingg_message'].toString();
  }

/////////////////////

  /////////////////////////////
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(top: 10, bottom: 10),
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Container(
              padding:
                  EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
              child: Align(
                alignment: (messageType == "sender"
                    ? Alignment.topLeft
                    : Alignment.topRight),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: message_color,
                    ),
                    padding: EdgeInsets.all(16),
                    child: (academic_message == null  )
                        ? Container(height: 150.0,
                  width: 150.0,
                  child: Column(children: <Widget>[Image(
                    height: 100.0,
                    width: 100.0,
                    fit: BoxFit.cover,
                    image: NetworkImage(url),
                  )
                    ,InkWell(onTap: () => launch(url),
                      child: Text("Download attachment",
                        style: TextStyle(fontSize: 15,color: Colors.blue,decoration: TextDecoration.underline),
                      ),
                    )],),
                )
                        : Text(
                            academic_message,
                            style: TextStyle(fontSize: 15),
                          )

                    // child: Text(     academic_message,
                    //
                    //
                    //
                    //   style: TextStyle(fontSize: 15),),
                    ),
              ),
            ),
            SizedBox(
              width: width * 0.01,
            ),
            Align(
              alignment: (messageType == "sender"
                  ? Alignment.topLeft
                  : Alignment.topRight),
              child: Text(
                "sent at " + formattedDate,
                // textAlign: messageType == "sender"?TextAlign.right:TextAlign.left,

                style: TextStyle(color: Colors.grey, fontSize: 10),
              ),
            ),
          ]),
    );
  }
}
//

class messageClerk extends StatelessWidget {
  String clerk_message;
  String urll;
  var message_colorr;
  String picc;
  String messageType;


  Key key;
  //:super(key: key)
  //super(key: key);
  messageClerk({
    this.clerk_message,
    this.messageType,
    this.message_colorr,
    this.key,

  });
  //messageClerk({this.incommingg_message, var colorr, String messageType, Key key})
      //: super(key: key)
  // {
  //   // this.pic = picture;
  //   this.clerk_message = incommingg_message;
  //   this.message_colorr = colorr;
  //   this.messageType = messageType;
  // }

  messageClerk.file(String urll, var colorr, String messageType, Key key)
      : super(key: key) {
    // this.pic = picture;
    this.urll = urll;
    this.message_colorr = colorr;
    this.messageType = messageType;
  }

  messageClerk.fromJson(Map<String, dynamic> json) {
    this.clerk_message = json['incommingg_message'].toString();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(top: 10, bottom: 10),
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Container(
              padding:
                  EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
              child: Align(
                alignment: (messageType == "sender"
                    ? Alignment.topLeft
                    : Alignment.topRight),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: message_colorr,
                    ),
                    padding: EdgeInsets.all(16),
                    child: (clerk_message == null  )
                        ?Container(height: 150.0,
                        width: 150.0,
                          child: Column(children: <Widget>[Image(
                      height: 100.0,
                      width: 100.0,
                      fit: BoxFit.cover,
                      image: NetworkImage(urll),
                    )
                    ,InkWell(onTap: () => launch(urll),
                      child: Text("Download attachment",
                            style: TextStyle(fontSize: 15,color: Colors.blue,decoration: TextDecoration.underline),
                        ),
                    )],),
                        )
                        : Text(
                            clerk_message,
                            style: TextStyle(fontSize: 15),
                          )),
              ),
            ),
            SizedBox(
              width: width * 0.01,
            ),
            Align(
              alignment: (messageType == "sender"
                  ? Alignment.topLeft
                  : Alignment.topRight),
              child: Text(
                "sent at " + formattedDate,
                // textAlign: messageType == "sender"?TextAlign.right:TextAlign.left,

                style: TextStyle(color: Colors.grey, fontSize: 10),
              ),
            ),
          ]),
    );
  }
}

/////////////////:
class Messages {
  int id;
  String message;
  int userId;
  String sender;
  int isSeen;
  String createdAt;
  String updatedAt;
  String file;
  String fileName;

  Messages(
      {this.id,
      this.message,
      this.userId,
      this.sender,
      this.isSeen,
      this.createdAt,
      this.updatedAt,
      this.file,
      this.fileName});

  Messages.empty() {
    id = -1;
  }

  Messages.fromJson(Map<String, dynamic> json) {
    try {
      id = json['id'] ?? 0;
      message = json['message'];
      userId = json['user_id'];
      sender = json['sender'];
      isSeen = json['is_seen'];
      createdAt = json['created_at'];
      updatedAt = json['updated_at'];
      file = json['file'];
      fileName = json['file_name'];
    } catch (e) {
      print(e.toString());
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['message'] = this.message;
    data['user_id'] = this.userId;
    data['sender'] = this.sender;
    data['is_seen'] = this.isSeen;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['file'] = this.file;
    data['file_name'] = this.fileName;
    return data;
  }
}

class Autogenerated {
  List<Messages> messages;

  Autogenerated({this.messages});

  Autogenerated.fromJson(Map<String, dynamic> json) {
    if (json['messages'] != null) {
      messages = new List<Messages>();
      json['messages'].forEach((v) {
        messages.add(new Messages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.messages != null) {
      data['messages'] = this.messages.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

//
