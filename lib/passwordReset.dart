import 'dart:convert';
import 'package:chat_bot/SignUp.dart';
import 'package:chat_bot/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'API/connection_laravel.dart';
import 'ForgetPassword.dart';
import 'home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart'; //this is important

class passwordReset extends StatefulWidget {
  @override
  _passwordResetState createState() => _passwordResetState();
}

TextEditingController email = new TextEditingController();
TextEditingController code = new TextEditingController();

TextEditingController pass = new TextEditingController();

class _passwordResetState extends State<passwordReset> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  static bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }

  @override
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Widget build(BuildContext context) {
    Auth auth = Auth();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Material(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        body: Form(
          key: _globalKey,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 3.0),
                child: Center(
                  child: Container(
                    width: width * 0.4,
                    height: height * 0.3,
                    child: Image.asset("images/chatbot.jpeg"),
                  ),
                ),
              ),
              Center(
                child: Text(
                  "Welcome To our ChatBot....",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35.0, vertical: 15),
                child: TextFormField(
                  controller: code,
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
                        Icons.vpn_key,
                        color: Colors.blue,
                      ),
                      hintText: "password",
                      hintStyle: TextStyle(fontFamily: 'font')),
                  keyboardType: TextInputType.visiblePassword,
                  onFieldSubmitted: (value) {},
                  obscureText: true,
                  validator: (v) {
                    if (v.isEmpty) {
                      return 'input require';
                    } else if (v.trim().length < 6) {
                      return 'this password is too short';
                    } else
                      return null;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35.0, vertical: 15),
                child: TextFormField(
                  controller: pass,
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
                        Icons.vpn_key,
                        color: Colors.blue,
                      ),
                      hintText: "Code",
                      hintStyle: TextStyle(fontFamily: 'font')),
                  keyboardType: TextInputType.visiblePassword,
                  onFieldSubmitted: (value) {},
                  obscureText: true,
                  validator: (v) {
                    if (v.isEmpty) {
                      return 'input require';
                    } else if (v.trim().length < 6) {
                      return 'this password is too short';
                    } else
                      return null;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                child: Builder(
                  builder: (context) => FlatButton(
                    onPressed: () async {
                      var response = await http.post(
                          "http://192.168.43.136:8000/api/passwordReset",
                          body: {
                            "email": email.text,
                            "code": code.text,
                            "password": pass.text
                          });
                      if (response.statusCode==200){
                        print("jjj");
                        _scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text(
                            "code correct",
                            style: TextStyle(fontFamily: 'font'),
                          ),
                        )
                        );
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                loginn()));

                      }else {
                        print("sds");
                        _scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text(
                            "code isnot correct",
                            style: TextStyle(fontFamily: 'font'),
                          ),
                        ));


                      }
                    },
                    padding: EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Colors.black,
                    child: Center(
                      child: Text(
                        "ok",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              //   child: Center(
              //       child: Text(
              //     "Forget Password ",
              //     style: TextStyle(
              //         fontFamily: 'font',
              //         decoration: TextDecoration.underline,
              //         fontSize: 16,
              //         color: Colors.black),
              //   )),
              // ),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => ForgetPassword()));
              //   },
                // child: Padding(
                //   padding: const EdgeInsets.only(top: 8.0),
                //   child: Center(
                //       child: Text(
                //     "forget password",
                //     style: TextStyle(
                //         fontFamily: 'font',
                //         decoration: TextDecoration.underline,
                //         fontSize: 16,
                //         color: Colors.black),
                //   )),
                // ),
             // ),

              ///
              // Center(
              //   child: Text(
              //     "Don't Have An Account?",
              //     style: TextStyle(color: Colors.black),
              //   ),
              // ),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.push(context,
              //         MaterialPageRoute(builder: (context) => SignUp()));
              //   },
              //   child: Padding(
              //     padding: const EdgeInsets.only(top: 8.0),
              //     child: Center(
              //         child: Text(
              //       "Sign Up",
              //       style: TextStyle(
              //           fontFamily: 'font',
              //           decoration: TextDecoration.underline,
              //           fontSize: 16,
              //           color: Colors.black),
              //     )),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

var token;
Future laravel_login(var userName, var password, BuildContext context) async {
  //pref.setInt('id', id);
//    print(connection_laravel.login());
  var Response = await http.post(connection_laravel.login(),
      body: {"email": userName, "password": password});
  if (Response.statusCode == 200) {
    var jsonObject = json.decode(Response.body);
    if (jsonObject["token"] != null) {
      // SharedPreferences pref = await SharedPreferences.getInstance();
      //final SharedPreferences local = await _pref;
      //  pref.setString("token", token);
      token = jsonObject["token"];
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString("token", token);

      final String t = pref.getString("token");
      //

      //print(t);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  } else {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(
        "Password or email does not exist",
        style: TextStyle(fontFamily: 'font'),
      ),
    ));
  }
}
