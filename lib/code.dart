import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast2/fluttertoast.dart';
import 'package:toast/toast.dart';

import 'login.dart';

class Code extends StatefulWidget {
  final String email;

  Code({this.email});
  @override
  _CodeState createState() => _CodeState();
}

class _CodeState extends State<Code> {
  TextEditingController _code = TextEditingController();
  @override
  void f(BuildContext  context,String t){
    final scaffold= Scaffold.of(context);
    scaffold.showSnackBar(SnackBar(
      content: Text(
        t,
        style: TextStyle(fontFamily: 'font'),
      ),
    )
    );
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Container(
              //padding: EdgeInsets.all(7),
              height: 60,
              decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(7),
                  color: Colors.grey[100],
                  border: Border(bottom: BorderSide(color: Colors.grey[100]))),
              child: TextField(
                controller: _code,
                enableSuggestions: false,
                autocorrect: false,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "code",
                    hintStyle: TextStyle(color: Colors.grey[400])),
              ),
            ),
          ),
          Container(
            height: 45,
            width: MediaQuery.of(context).size.width - 40,
            child: RaisedButton(
              elevation: 5.0,
              color: Colors.blue[500],
              onPressed: () async {
                http.Response resopnse = await http.post(
                    "http://192.168.43.136:8000/api/VerifyEmailByCode",
                    body: {"email": widget.email, "code": _code.text});
                print(resopnse.statusCode);
                print(resopnse.body);


                /*
                Fluttertoast.showToast(
        msg: "Toast",
        toastDuration: Toast.LENGTH_SHORT,
        toasrGravity: ToastGravity.CENTER,
        time: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
    Toast.show("Toast plugin app", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                 */

                if (resopnse.statusCode == 200) {
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
                }
                else {
                  print("sds");
                  _scaffoldKey.currentState.showSnackBar(SnackBar(
                    content: Text(
                      "code isnot correct",
                      style: TextStyle(fontFamily: 'font'),
                    ),
                  ));
                }
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Text(
                "Verify ",
                style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 1.5,
                    fontSize: MediaQuery.of(context).size.width / 25),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
