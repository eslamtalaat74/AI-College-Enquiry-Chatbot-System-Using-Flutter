import 'package:chat_bot/login.dart';
import 'package:chat_bot/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ShowProfile extends StatefulWidget {
  final FirebaseUser user;
  ShowProfile({@required this.user});

  @override
  _ShowProfileState createState() => _ShowProfileState();
}

class _ShowProfileState extends State<ShowProfile> {

  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //
  //   print('here');
  // }

  @override
  Widget build(BuildContext context) {
    String name = widget.user.displayName;
    String email = widget.user.email;
    String password =widget.user.updatePassword as String;
    String photoUrl = widget.user.photoUrl;
    String uid = widget.user.uid;
    // String gender=widget.user.gender;
    //String birth=widget.user.birth;
//

    return Scaffold(
        body: Center(
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        color: Colors.black26,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              child: Image.network(photoUrl),
            ),
            Text(
              name,
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
            SizedBox(
              height: 10,
            ),
            Text(email, style: TextStyle(fontSize: 20, color: Colors.blue)),
            SizedBox(
              height: 10,
            ),
            Text(
              password,
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
            SizedBox(
              height: 10,
            ),
            Text(uid, style: TextStyle(fontSize: 20, color: Colors.blue)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120.0),
              child: FlatButton(
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  onPressed: () async {
                    // await AuthService().deleteUser(email, password);
                    FirebaseUser user =
                        await FirebaseAuth.instance.currentUser();
                    user.delete();
                  },
                  child: Center(
                    child: Text(
                      "Delete Account",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  )),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 120.0),
                child: FlatButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.of(context)
                        .pop(MaterialPageRoute(builder: (context) => loginn()));
                  },
                  child: Center(
                    child: Row(
                      children: [
                        Text(
                          "Logout         ",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.navigation,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    ));
  }
}
