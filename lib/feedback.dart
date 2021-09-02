import 'dart:convert';
import 'package:chat_bot/SignUp.dart';
import 'package:chat_bot/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'API/connection_laravel.dart';
import 'home.dart';
import 'package:shared_preferences/shared_preferences.dart';//this is important

class feedback extends StatefulWidget {
  @override
  _feedbackState createState() => _feedbackState();
}

TextEditingController email=new TextEditingController();
TextEditingController text=new TextEditingController();

class _feedbackState extends State<feedback> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  static bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }
  @override
  Widget build(BuildContext context) {
    Auth auth = Auth();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Material(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: _globalKey,
          child: ListView(
            children: <Widget>[
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 35.0, vertical: 15),
                child: TextFormField(
                  controller: email,
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
                      prefixIcon: Icon(
                        Icons.supervised_user_circle,
                        color: Colors.blue,
                      ),
                      hintText: "Email",
                      hintStyle: TextStyle(fontFamily: 'font')),
                  validator: (v) {
                    if (v.isEmpty) {
                      return 'input require';
                    }else
                      //
                    if (v.isEmpty ||
                        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(v)) {
                      return 'Enter a valid email!';
                    }
                    return null;

                    //
                  },
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 35.0, vertical: 15),
                child: TextFormField(controller: text,
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
                     // filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(
                        Icons.vpn_key,
                        color: Colors.blue,
                      ),
                    //  hintText: "Password",
                      hintStyle: TextStyle(fontFamily: 'font')),
                  keyboardType: TextInputType.visiblePassword,
                  onFieldSubmitted: (value) {},
                  obscureText: false,

                ),
              ),
              //
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                child: Builder(
                  builder: (context) => FlatButton(
                    onPressed: () {

                      if (_globalKey.currentState.validate()) {
                        laravel_feedback(email.text, text.text, context);
                      }
                    },
                    padding: EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Colors.black,
                    child: Center(
                      child: Text(
                        "OK",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),



//
            ],
          ),
        ),
      ),
    );
  }
}

var token;
Future laravel_feedback(var userName, var text,BuildContext context) async {

  SharedPreferences pref = await SharedPreferences.getInstance();
  String token = pref.getString('token');

  //pref.setInt('id', id);
//    print(connection_laravel.login());
  var Response = await http.post(connection_laravel.feedback(),
      headers: {
      //  "Accept": "application/json",
        'Authorization': 'Bearer $token',
      },
      body: {"email": userName, "text": text});
  if (Response.statusCode == 200) {
    var jsonObject = json.decode(Response.body);

      // SharedPreferences pref = await SharedPreferences.getInstance();
      //final SharedPreferences local = await _pref;
      //  pref.setString("token", token);


      //

      //print(t);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomeScreen()));
    }


  }

