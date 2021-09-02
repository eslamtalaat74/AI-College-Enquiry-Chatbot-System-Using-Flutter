import 'package:chat_bot/help.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './API/CALL.dart';
import 'API/message.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Clerk.dart';
import 'Theme/AppTheme.dart'; //this is important

TextEditingController message_controller = new TextEditingController();

ScrollController s_controller = new ScrollController();
bool isLoggedIn = false;
List<message> memo = [];

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  String bot_back_msg = '';

  Future _checkToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.get('token');
    //sharedPreferences.setString("memo",);

    // print(token);

    setState(() {
      print('jj');
      print(memo);
      if (token == null) {
        memo = [];
        isLoggedIn = false;
      } else {
        print(memo);

        // print(token);
        isLoggedIn = true;
      }
    });
  }

  void initState() {
    _checkToken();
  }

  get f async {
    var url = Uri.parse('http://127.0.0.1:5000/');
    var response = await http.post(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppTheme.mainColor,
          centerTitle: true,
          leading: Container(),
          title: Text("ChatBot"),
          actions:[
            IconButton(icon: Icon(Icons.help),
              onPressed: (){
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) =>Help()));

              },

            ),


            bot_back_msg== "I don't understand!"


                || bot_back_msg==  "Sorry, can't understand you"
            || bot_back_msg==  "what do you mean by that"
            ||bot_back_msg==  "What does that mean?"
            ||bot_back_msg==  "I don't understand!"
                ||bot_back_msg==  "chat with clerk"
                ||bot_back_msg==  "explain please!"
                ||bot_back_msg==  "I do not understand what you say..!"
                ||bot_back_msg==  "more clarification,please!"
                ||bot_back_msg==  "chat with clerk"
                // ||bot_back_msg==  "chat with clerk"
                // ||bot_back_msg==  "chat with clerk"
                // ||bot_back_msg==  "chat with clerk"

           || bot_back_msg==  "more"?
            // FlatButton.icon(onPressed: (){
            //   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>clerk()));
            // }, icon: Icon(Icons.chat,), label:null):
            IconButton(icon:Icon(Icons.chat,) ,
                onPressed: (){
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) =>clerk())

                  );

                }):
            Container()
          ]

      ),
      body: Container(
        height: (height - MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    controller: s_controller,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          children: memo,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35.0, vertical: 15),
                child: TextField(
                  controller: message_controller,
                  cursorColor: Colors.blue,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue)),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Type Something....",
                    hintStyle: TextStyle(fontFamily: 'font'),
                    suffixIcon: FlatButton(
                      child: Icon(Icons.send),
                      onPressed: () async {
                        // print("hi");
                        // print(message_controller.text);
                        // print("hi");
                        memo.add(new message(
                            botMessage: message_controller.text ?? '',
                            messageColor: Colors.green,
                            messageType: "sender"
                            //  "images/profile.jpg"
                            ));
                        message x =
                            await CALL.SEND_MESSAGE(message_controller.text ?? '');
                        memo.add(x);

                        setState(() {
                          message_controller.clear();
                          bot_back_msg = x.botMessage;
                        });
                        setState(() {
                          s_controller.animateTo(
                              s_controller.position.maxScrollExtent + 100000,
                              duration: Duration(microseconds: 1),
                              curve: Curves.ease);
                        });
                      },
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
