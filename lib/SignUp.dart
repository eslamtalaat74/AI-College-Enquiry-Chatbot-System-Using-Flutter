// ignore: unused_import
import 'dart:convert';
import 'API/connection_laravel.dart';
import 'package:chat_bot/models/user.dart';
import 'package:chat_bot/services/auth.dart';
import 'package:chat_bot/services/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: unused_import
import 'package:http/http.dart' as http;

import 'code.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

TextEditingController name = new TextEditingController();
TextEditingController lastname = new TextEditingController();
TextEditingController email = new TextEditingController();
TextEditingController pass = new TextEditingController();
TextEditingController c_pass = new TextEditingController();
TextEditingController address = new TextEditingController();
TextEditingController phone = new TextEditingController();
TextEditingController birth = new TextEditingController();
TextEditingController acceptTerms = new TextEditingController();

class _SignUpState extends State<SignUp> {
  bool check = false;

  String _firstName,
      _c_password,
      _lastName,
      _email,
      _password,
      _address,
      _gender,
      hint = "Pick Your BirthDay..";
  //


  // ignore: unused_field
  DateTime _birthDay;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  int _radioValue = 0;
  DateTime currentDate = DateTime.now();

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 1:
          _gender = "male";
          break;
        case 2:
          _gender = "female";
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Auth auth = Auth();
    Store store = Store();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Material(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(30),
          child: Form(
            key: _globalKey,
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3.0),
                  child: Center(
                    child: Container(
                      width: width * 0.3,
                      height: height * 0.2,
                      child: Image.asset("images/chatbot.jpeg"),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35.0, vertical: 5),
                  child: TextFormField(
                    controller: name,
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
                        hintText: "Fist Name",
                        hintStyle: TextStyle(fontFamily: 'font'),
                          ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter a valid firstname';
                        }}

                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35.0, vertical: 10),
                  child: TextFormField(
                    controller: lastname,
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
                        hintText: "Last Name",
                        hintStyle: TextStyle(fontFamily: 'font')),
    //
    validator: (value) {
    if (value.isEmpty) {
    return 'Enter a valid lastname';
    }}
                    //
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35.0, vertical: 10),
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
                          Icons.mail,
                          color: Colors.blue,
                        ),
                        hintText: "Email",
                        hintStyle: TextStyle(fontFamily: 'font')),
                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted: (value) {
                      //Validator
                    },
                    validator: (value) {
                      if (value.isEmpty ||
                          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                        return 'Enter a valid email!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35.0, vertical: 10),
                  child: TextFormField(
                    controller: phone,
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
                          Icons.phone,
                          color: Colors.blue,
                        ),
                        hintText: "phone",
                        hintStyle: TextStyle(fontFamily: 'font')),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter a valid phone';
                        }}
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35.0, vertical: 10),
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
                        hintText: "Password",
                        hintStyle: TextStyle(fontFamily: 'font')),
                    keyboardType: TextInputType.visiblePassword,
                    onFieldSubmitted: (value) {},
                    obscureText: true,
                    validator: (v) {
                      if (v.isEmpty) {
                        return 'Enter a valid password!';
                        print('jjjj');
                      }

                      else if (v.trim().length < 8) {
                      return 'this password is too short';
                      }
                    },

                  ),

                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35.0, vertical: 10),
                  child: TextFormField(
                    controller: c_pass,
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
                        hintText: "Confirm Password",
                        hintStyle: TextStyle(fontFamily: 'font')),
                    keyboardType: TextInputType.visiblePassword,
                    onFieldSubmitted: (value) {},
                    obscureText: true,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter a valid password!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35.0, vertical: 10),
                  child: TextFormField(
                    controller: address,
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
                          Icons.navigation,
                          color: Colors.blue,
                        ),
                        hintText: "Address",
                        hintStyle: TextStyle(fontFamily: 'font')),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter a valid address';
                        }}
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35.0, vertical: 10),
                  child: TextField(
                    controller: birth,
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
                          Icons.cake,
                          color: Colors.blue,
                        ),
                        hintText: hint,
                        hintStyle: TextStyle(fontFamily: 'font'),
                        suffixIcon: InkWell(
                            onTap: () {
                              _selectDate(context);
                            },
                            child: Icon(
                              Icons.date_range,
                              color: Colors.red,
                            ))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Gender",
                        style: TextStyle(color: Colors.black),
                      ),
                      Row(
                        children: <Widget>[
                          Radio(
                              value: 1,
                              groupValue: _radioValue,
                              onChanged: _handleRadioValueChange),
                          Text(
                            "Male",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Radio(
                              value: 2,
                              groupValue: _radioValue,
                              onChanged: _handleRadioValueChange),
                          Text(
                            "Female",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    margin: const EdgeInsets.all(30.0),
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(

                        border: Border.all(color: Colors.blueAccent)
                    ),
                    child: Column(children: <Widget>[
                      Text("English abbreviations are forbidden"),

                      SizedBox(height: 10,),
                      // Text("English abbreviations are forbidden"),
                      // SizedBox(height: 10,),
                      // Text("English abbreviations are forbidden"),
                      // SizedBox(height: 10,),
                    ],),
                  ),
                ),
                Center(
                  child: Row(
                   // controller:acceptTerms,
                    children: <Widget>[

                      Checkbox(
                        value: check,
                        onChanged: (val) {
                          setState(() {
                            check = val;
                          });
                        },
                          ),

                      Text("Agree With Our Policy...")
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  child: Builder(
                    builder: (context) => FlatButton(
                      onPressed: () async {
    if (_globalKey.currentState.validate()) {
      laravel_signup(
          context,
          name.text,
          // birthday.text,
          lastname.text,
          email.text,
          pass.text,
          address.text,
          _gender,
          birth.text,
          c_pass.text,
          phone.text);

    }
                        /*
                        if (_globalKey.currentState.validate()) {
                          _globalKey.currentState.save();
                          try {
                            final authResult =
                                await auth.sign_up_with_email_and_password(
                                    _email, _password);
                            store.adduser(User(_firstName, authResult.user.uid,
                                _lastName, _address, _gender, currentDate));
                            // Navigator.pushNamed(context, waitngWidget.id);
                            Navigator.pop(context);
                            print(authResult.user.uid);
                          } on PlatformException catch (e) {
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text(
                                e.message.toString(),
                                style: TextStyle(fontFamily: 'font'),
                              ),
                            ));
                          }
                        }
                      */
                      },
                      padding: EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.black,
                      child: Center(
                        child: Text(
                          "Register",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 12),

                )
              ],
            ),
          ),
        ),

      ),
    );
  }
  static bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }
  Future<void> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1980),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
        hint = currentDate.toString();
        birth.text = currentDate.toString();
      });
  }
}

void laravel_signup(
    BuildContext context,
    String firstName,
    String lastName,
    String email,
    String password,
    String address,
    String gender,
    String birthDay,
    String c_password,

    String phone) async {

  try {
    if (password == c_password) {
      print("ok");
      var Response = await http.post(
        connection_laravel.register(),
       // headers: {"Accept": "application/json",},
        body: {
          "name": firstName.trim() + " " + lastName.trim(),
          "email": email,
          "password": password,
          "phone": phone,
          "address": address,
          "gender": gender,
          "birthdate": birthDay,
          "acceptTerms":"1"
        },
      );
      print(Response.body.toString());
      if (Response.statusCode == 200) {

        var respnse1=await http.post("http://192.168.1.5:8000/api/SendVerificationCode",body:{"email":email});
        if (respnse1.statusCode==400){
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(
              "we send Verification Code ",
              style: TextStyle(fontFamily: 'font'),
            ),
          ));
        }
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) =>
                Code(email: email,)));
      }


     else

      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(
          "Passwords does not match",
          style: TextStyle(fontFamily: 'font'),
        ),
      ));
    }
  } catch (ex) {
    print(ex);
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(
       /* "Email alrady exists"*/ ex.toString(),
        style: TextStyle(fontFamily: 'font'),

      ),
    ));
  }
}


