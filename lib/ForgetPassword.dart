import 'dart:convert';
import 'package:chat_bot/SignUp.dart';
import 'package:chat_bot/passwordReset.dart';
import 'package:chat_bot/passwordcode.dart';
import 'package:chat_bot/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'API/connection_laravel.dart';
import 'code.dart';
import 'home.dart';
import 'package:shared_preferences/shared_preferences.dart'; //this is important

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

TextEditingController email = new TextEditingController();
TextEditingController text = new TextEditingController();

class _ForgetPasswordState extends State<ForgetPassword> {
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
                    } else
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

              //
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                child: Builder(
                  builder: (context) => FlatButton(
                    onPressed: () async{
                      var respnse1 = await http.post(
                          "http://192.168.43.136:8000/api/forgotPassword",
                          body: {"email": email.text});
                      if (respnse1.statusCode == 200) {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text(
                            "we send Verification Code ",
                            style: TextStyle(fontFamily: 'font'),
                          ),
                        ));

                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => passwordReset()));
                      }
                    },
                    padding: EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Colors.black,
                    child: Center(
                      child: Text(
                        "Send Reset Link",
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

  var token;

  Future laravel_forgetPassword() async {

  }
}
