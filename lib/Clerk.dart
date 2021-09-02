import 'dart:async';
import 'dart:convert';

import 'package:chat_bot/AcademicAdvisor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './API/CALL.dart';
import 'API/message.dart';
import 'package:shared_preferences/shared_preferences.dart';//this is important
import 'package:chat_bot/API/connection_laravel.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'Theme/AppTheme.dart';
import 'help.dart';

TextEditingController clerkmessage_controller = new TextEditingController();

ScrollController clerk_controller = new ScrollController();
bool isLoggedIn = false;
List<messageClerk> memo=[] ;
//
Timer timer;
@override

class clerk extends StatefulWidget {
  @override
  _clerkState createState() => _clerkState();
}

class _clerkState extends State<clerk> {
  String clerk_back_msg = '';
  Timer timer1;

  Future _checkToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.get('token');

    //sharedPreferences.setString("memo",);

    // print(token);

    setState(() {
      print('jj');
      print(memo);
      if (token == null) {
        memo=[];
        isLoggedIn = false;
      } else {
        print(memo);

        // print(token);
        isLoggedIn = true;
      }
    });
  }


  @override
  void initState() {
    super.initState();
    //  timer = Timer.periodic(Duration(seconds: 2), (Timer t) => messagesWithAcademic());
    /*  if(timer1==null){
        timer1=Timer.periodic(Duration(seconds: 3), (timer)  => getAcademicMessage());
      }*/
    _checkToken();
  }



  void getClerkMessage() async{
    print("[timer]  getClerkMessage called");
    Widget y =
    await CALL.messagesWithClerk(clerkmessage_controller.text);

    if(y!=null) {
      print("I Have been called for no reason");
      setState(() {
        memo.add(y);
        // academicmessage_controller.clear();
      });
    }
    print(y);
  }
  Future messagesWithClerk() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("token");
    var Response = await http.get(connection_laravel.sendMessageToClerk(),
        headers: {
          'Authorization': 'Bearer $token',
        }
    );
    print(Response.statusCode);
    if (Response.statusCode == 200) {
      var jsonObject = json.decode(Response.body);
      if (jsonObject["token"] != null) {
        token = jsonObject["token"];
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString("token", token);
        final String t = pref.getString("token");
      }
    }
  }
  @override
  void dispose() {
    timer1?.cancel();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    if(timer1==null){
      timer1=Timer.periodic(Duration(seconds: 6), (timer)  => getClerkMessage());
    }
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Material(
      child : Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: AppTheme.mainColor,
            centerTitle: true,
            leading: Container(),
            title: Text("Clerk"),
            actions:[
              IconButton(icon: Icon(Icons.help),
                onPressed: (){
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) =>Help()));

                },

              ),


              clerk_back_msg== "Hello" || clerk_back_msg==  "hi"
                  || clerk_back_msg==  "what do you mean by that"
                  ||clerk_back_msg==  "What does that mean?"
                  ||clerk_back_msg==  "i want to chat with academic advisor"
                  ||clerk_back_msg==  "I don't understand!"
                  || clerk_back_msg==  "more"? IconButton(icon:Icon(Icons.chat),

                  onPressed: (){
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) =>AcademicAdvisor()));

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
                      controller: clerk_controller,
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
                    controller: clerkmessage_controller,
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
                          print(clerkmessage_controller.text);
                          print("k");
                          print(clerk_back_msg);
                          print("k");

                          messageClerk clerk = new messageClerk(
                              clerk_message:clerkmessage_controller.text
                              ,message_colorr:
                          Colors.green,messageType: "sender",
                              key: ValueKey((clerkmessage_controller.text )));
                          memo.add(clerk);
                          // Widget x =
                          // await CALL.SEND_Academic_MESSAGE(academicmessage_controller.text);
                          // memo.add(x);
                          setState(() {
                            clerk_back_msg = clerk.clerk_message;
                          });
                          Widget y =
                          await CALL.SEND_Clerk_MESSAGE(clerkmessage_controller.text );
                           // memo.add(y);

                          /*  setState(() {
                          academicmessage_controller.clear();
                        });*/
                          print("k");
                          print(clerk_back_msg);
                          print("k");
                          setState(() {

                            clerk_controller.animateTo(
                                clerk_controller.position.maxScrollExtent + 100000,
                                duration: Duration(microseconds: 1),
                                curve: Curves.ease
                            );
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
      ),
    );
  }
}
