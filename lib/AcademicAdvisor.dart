import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './API/CALL.dart';
import 'API/message.dart';
import 'package:shared_preferences/shared_preferences.dart';//this is important
import 'package:chat_bot/API/connection_laravel.dart';
import 'package:http/http.dart' as http;

import 'Theme/AppTheme.dart';
import 'help.dart';

TextEditingController academicmessage_controller = new TextEditingController();

ScrollController academic_controller = new ScrollController();
bool isLoggedIn = false;
List<messageAcademic> memo=[] ;
//
Timer timer;
@override

class AcademicAdvisor extends StatefulWidget {
  @override
  _AcademicAdvisorState createState() => _AcademicAdvisorState();
}

class _AcademicAdvisorState extends State<AcademicAdvisor> {
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



  void getAcademicMessage() async{
    print("[timer] called");
    Widget y =
    await CALL.messagesWithAcademic(academicmessage_controller.text);

    if(y!=null) {
      print("I Have been called for no reason");
      setState(() {
        memo.add(y);
        // academicmessage_controller.clear();
      });
    }
    print(y);

  }
  Future messagesWithAcademic() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("token");
    var Response = await http.get(connection_laravel.sendMessageToAcademic(),
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
      timer1=Timer.periodic(Duration(seconds: 6), (timer)  => getAcademicMessage());
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
          title: Text("Academic"),
            actions:[
        IconButton(icon: Icon(Icons.help),
      onPressed: (){
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) =>Help()));

      },

    ),
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
                    controller: academic_controller,
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
                  controller: academicmessage_controller,
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
                        print(academicmessage_controller.text);
                        memo.add(new messageAcademic(academicmessage_controller.text,
                            Colors.green, "sender" ,
                            ValueKey((academicmessage_controller.text))));
                       // Widget x =
                       // await CALL.SEND_Academic_MESSAGE(academicmessage_controller.text);
                       // memo.add(x);
                        Widget y =
                        await CALL.SEND_Academic_MESSAGE(academicmessage_controller.text);
                      //  memo.add(y);

                      /*  setState(() {
                          academicmessage_controller.clear();
                        });*/
                        setState(() {
                          academic_controller.animateTo(
                              academic_controller.position.maxScrollExtent + 100000,
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
