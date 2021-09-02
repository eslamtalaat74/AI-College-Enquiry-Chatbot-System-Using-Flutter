import 'dart:convert';
import 'package:chat_bot/SignUp.dart';
import 'package:chat_bot/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'API/connection_laravel.dart';
import 'ForgetPassword.dart';
import 'home.dart';
import 'package:shared_preferences/shared_preferences.dart';//this is important

class loginn extends StatefulWidget {
  @override
  _loginnState createState() => _loginnState();
}

TextEditingController user=new TextEditingController();
TextEditingController pass=new TextEditingController();

class _loginnState extends State<loginn> {
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
                  controller: user,
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
                child: TextFormField(controller: pass,
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
                      hintText: "Password",
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
                    onPressed: () {

    if (_globalKey.currentState.validate()) {
      laravel_login(user.text, pass.text, context);
    }

                    },
                    padding: EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Colors.black,
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ForgetPassword()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Center(
                      child: Text(
                        "forget password",
                        style: TextStyle(
                            fontFamily: 'font',
                            decoration: TextDecoration.underline,
                            fontSize: 16,
                            color: Colors.black),
                      )),
                ),
              ),






              ///
              Center(
                child: Text(
                  "Don't Have An Account?",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUp()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Center(
                      child: Text(
                    "Sign Up",
                    style: TextStyle(
                        fontFamily: 'font',
                        decoration: TextDecoration.underline,
                        fontSize: 16,
                        color: Colors.black),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

var token;
Future laravel_login(var userName, var password,BuildContext context) async {


  //pref.setInt('id', id);
//    print(connection_laravel.login());
    var Response = await http.post(connection_laravel.login(),
        body: {"email": userName, "password": password});
    if (Response.statusCode == 200) {
      var jsonObject = json.decode(Response.body);
      if(jsonObject["token"]!=null){
       // SharedPreferences pref = await SharedPreferences.getInstance();
        //final SharedPreferences local = await _pref;
      //  pref.setString("token", token);
        token=jsonObject["token"];
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString("token",token);
        pref.setString("password", password);
        print(pref.get("password"));


        final String t = pref.getString("token") ;
        //

        //print(t);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomeScreen()));
      }


  }  else{
  Scaffold.of(context).showSnackBar(SnackBar(
  content: Text(
  "Password or email does not exist",
  style: TextStyle(fontFamily: 'font'),
  ),
  ));
  }
}
