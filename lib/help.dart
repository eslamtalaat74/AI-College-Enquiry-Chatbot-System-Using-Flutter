import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Help extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Help",
          style: TextStyle(color: Colors.white,fontSize: 24.0,fontWeight: FontWeight.bold,),
          textAlign: TextAlign.center,
        )
      ),
      backgroundColor: Colors.white, 
      body: ListView(
        padding: EdgeInsets.all(5.0),
         children: [
          Container(
            margin: EdgeInsets.only(bottom: 5.0),
            padding: EdgeInsets.all(10.0),
            height: 150.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0)
                ),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff00BBDC), Color(0xff03CBCB)])),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                    "About Chatbot",
                  style: TextStyle(color: Colors.white,fontSize: 22.0,fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                 child: Text(
                  "This chat answers all the questions of the Modern University for Technology and Information and inquiries regarding admission to a college and knowledge of the expenses and the total admission and registration in each college.",
                  style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 14.0),
                 ),
                )
              ],
            ),
          ),
           Container(
             margin: EdgeInsets.only(bottom: 5.0),
             padding: EdgeInsets.all(10.0),
             height: 750.0,
             decoration: BoxDecoration(
                 borderRadius: BorderRadius.only(
                     topLeft: Radius.circular(15.0),
                     topRight: Radius.circular(15.0),
                     bottomLeft: Radius.circular(15.0),
                     bottomRight: Radius.circular(15.0)
                 ),
                 gradient: LinearGradient(
                     begin: Alignment.topCenter,
                     end: Alignment.bottomCenter,
                     colors: [Color(0xff00BBDC), Color(0xff03CBCB)])),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 Text(
                   "Registration Page ",
                   style: TextStyle(color: Colors.white,fontSize: 22.0,fontWeight: FontWeight.bold),
                 ),
                 Padding(
                   padding: EdgeInsets.only(left: 10.0),
                   child: Text(
                     "1-You must enter first and second name\n2-You must enter your correct email\n3-You must enter your phone number\n4-You must create password and confirm this password",
                     style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 14.0),
                   ),
                 ),
                 Padding(
                   padding: EdgeInsets.only(left: 10.0),
                   child: Image.asset('images/r.jpg'),
                 ),
               ],
             ),
           ),
          Container(
            margin: EdgeInsets.only(bottom: 5.0),
            padding: EdgeInsets.all(10.0),
            height: 900.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0)),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff00BBDC), Color(0xff03CBCB)])),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Login Problems",
                  style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 10.0),
                  child:Text(
                    "You forgot your username or password or logged in with the correct details and shaw a message that your account is locked ... Learn what steps you can take to solve the specific issue you are facing.",
                  style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 12.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child:Text(
                    "Reset the forgotten password :-",
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 18.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child:Text(
                    "Your account or password is incorrect. If you don't remember your password, reset it now.\nWe"
                        " recommend that you follow the steps below to solve private password issues",
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 12.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child:Text(
                    "1. Select Forgot your password",
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 14.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child:Text(
                    "Your account or password is incorrect. If you don't remember your password, reset it now.\n"
                        "If the password entry window is still open, select Forgot your password",
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 12.0),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Image.asset('images/f.jpg'),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child:Text(
                    "Type in your email. A message will be sent to your email to reset the password",
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 12.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Image.asset('images/r2.png'),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child:Text(
                    "If you've successfully reset your password, now is the time to set a reminder to verify or make changes to your"
                        " security contact information. Check your gmail.",
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 12.0),
                  ),
                ),
              ],
            ),
          ),
           Container(
             margin: EdgeInsets.only(bottom: 5.0),
             padding: EdgeInsets.all(10.0),
             height: 930.0,
             decoration: BoxDecoration(
                 borderRadius: BorderRadius.only(
                     topLeft: Radius.circular(15.0),
                     topRight: Radius.circular(15.0),
                     bottomLeft: Radius.circular(15.0),
                     bottomRight: Radius.circular(15.0)),
                 gradient: LinearGradient(
                     begin: Alignment.topCenter,
                     end: Alignment.bottomCenter,
                     colors: [Color(0xff00BBDC), Color(0xff03CBCB)])),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 Text(
                   "Profile Page",
                   style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),
                 ),
                 Padding(
                     padding: EdgeInsets.only(left: 10.0),
                     child:Text(
                       "Can change your name ",
                       style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 14.0),
                     )
                 ),
                 Padding(
                   padding: EdgeInsets.only(left: 10.0),
                   child: Image.asset('images/p.jpg'),
                 ),
                 Padding(
                     padding: EdgeInsets.only(left: 10.0),
                     child:Text(
                       "you can upload photo",
                       style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 14.0),
                     )
                 ),
                 Padding(
                   padding: EdgeInsets.only(left: 10.0),
                   child: Image.asset('images/p1.jpg'),
                 ),
               ],
             ),
           ),
          Container(
            margin: EdgeInsets.only(bottom: 5.0),
            padding: EdgeInsets.all(10.0),
            height: 250.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0)),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff00BBDC), Color(0xff03CBCB)])),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "About Page",
                  style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),
                ),
            Padding(
              padding: EdgeInsets.only(left: 15.0),
                child:Text(
                  "Information about team work..Click here",
                  style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 14.0),
                ),
               ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Image.asset('images/a.jpg'),
                ),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.only(bottom: 5.0),
            padding: EdgeInsets.all(10.0),
            height: 650.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0)),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff00BBDC), Color(0xff03CBCB)])),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Setting Page",
                  style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),
                ),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child:Text("You can choose the right theme for you from this page and change font size",
                  style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 14.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Image.asset('images/t.jpg'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
