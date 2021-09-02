// import 'package:chat_bot/API/CALL.dart';
// import 'package:chat_bot/services/delete.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import 'ShowProfile.dart';
// import 'login.dart';
//
// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }
//
// class _ProfilePageState extends State<ProfilePage> {
//   String email, password;
//
//   var user;
//
//
//
//   // getProfileData() async {
//   //   var user = await CALL.getProfileData();
//   //
//   //   // print('user data');
//   //   // print(user);
//   //
//   //   setState(() {
//   //     this.user = user;
//   //   });
//   // }
//
//   // @override
//   // void initState() {
//   //   // TODO: implement initState
//   //   super.initState();
//   // }
//
//   // final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       backgroundColor: Colors.grey.withOpacity(0.06),
//       body: ListView(
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 10.0),
//             child: Center(
//               child: CircleAvatar(
//                   radius: 30,
//                   backgroundImage: AssetImage(
//                     "images/profile.jpg",
//                   )),
//             ),
//           ),
//           Center(
//             child: Text(
//               // user.name,
//               'Esaaam',
//               style:
//                   TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Center(
//             child: Text(
//               "Egypt,Cairo",
//               style: TextStyle(color: Colors.grey, fontSize: 10),
//             ),
//           ),
//           SizedBox(
//             height: height * 0.02,
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12.0),
//             child: Container(
//               height: height * 0.2,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8), color: Colors.white),
//               child: Column(
//                 children: <Widget>[
//                   Row(
//                     children: <Widget>[
//                       SizedBox(
//                         width: width * 0.05,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 8.0),
//                         child: CircleAvatar(
//                             radius: 20,
//                             backgroundImage: AssetImage(
//                               "images/profile.jpg",
//                             )),
//                       ),
//                       SizedBox(
//                         width: width * 0.09,
//                       ),
//                       Container(
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(3),
//                             color: Colors.blue),
//                         child: Center(
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               "Upload Photo",
//                               style: TextStyle(color: Colors.white),
//                             ),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       "For best result use an image at least 256 px by 256 px in either .jpg or .png format",
//                       style: TextStyle(color: Colors.grey),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child: Text("First Name *"),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               height: height * 0.06,
//               child: TextField(
//                 decoration: InputDecoration(
//                     hintText: "Eslam",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(2),
//                     ),
//                     fillColor: Colors.grey.withOpacity(0.4),
//                     filled: true),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child: Text("Last Name *"),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               height: height * 0.06,
//               child: TextField(
//                 decoration: InputDecoration(
//                     hintText: "Talat",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(2),
//                     ),
//                     fillColor: Colors.grey.withOpacity(0.4),
//                     filled: true),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child: Text("Email *"),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               height: height * 0.06,
//               child: TextField(
//                 decoration: InputDecoration(
//                     hintText: "Eslam123@gmail.com",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(2),
//                     ),
//                     fillColor: Colors.grey.withOpacity(0.4),
//                     filled: true),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child: Text("Password *"),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               height: height * 0.06,
//               child: TextField(
//                 decoration: InputDecoration(
//                     hintText: "*************",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(2),
//                     ),
//                     fillColor: Colors.grey.withOpacity(0.4),
//                     filled: true),
//               ),
//             ),
//           ),
//           // Center(
//           //   child: Text(
//           //     "Delete Account",
//           //     style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
//           //   ),
//           // ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 120.0),
//             child: FlatButton(
//                 color: Colors.red,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(5)),
//                 onPressed: () async {
//                   // await AuthService().deleteUser(email, password);
//                   FirebaseUser user = await FirebaseAuth.instance.currentUser();
//                   user.delete();
//                 },
//                 child: Center(
//                   child: Text(
//                     "Delete Account",
//                     style: TextStyle(
//                         color: Colors.white, fontWeight: FontWeight.bold),
//                   ),
//                 )),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 120.0),
//             child: FlatButton(
//                 color: Colors.blue,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(5)),
//                 onPressed: () async {
//                   FirebaseUser user = await FirebaseAuth.instance.currentUser();
//                   await user.updateEmail(email);
//                   await user.updatePassword(password);
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => ShowProfile(user: user)));
//                 },
//                 child: Center(
//                   child: Text(
//                     "Apply",
//                     style: TextStyle(
//                         color: Colors.white, fontWeight: FontWeight.bold),
//                   ),
//                 )),
//           ),
//           Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 120.0),
//               child: FlatButton(
//                 color: Colors.blue,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(5)),
//                 onPressed: () {
//                   Navigator.of(context)
//                       .pop(MaterialPageRoute(builder: (context) => login()));
//                 },
//                 child: Center(
//                   child: Row(
//                     children: [
//                       Text(
//                         "Logout         ",
//                         style: TextStyle(
//                             color: Colors.white, fontWeight: FontWeight.bold),
//                       ),
//                       Icon(
//                         Icons.navigation,
//                         color: Colors.white,
//                       ),
//                     ],
//                   ),
//                 ),
//               )),
//         ],
//       ),
//     );
//   }
// }



import 'package:chat_bot/API/connection_laravel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:shared_preferences/shared_preferences.dart';//this is important


import 'ShowProfile.dart';
import 'login.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();

}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController birth = new TextEditingController();

  String email, password;
  // final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  //int _radioValue ;
  bool check = false;
  DateTime _birthDay;

 String _gender;
 /*void radioValue()
 {
   if(user["gender"]=="male")
     {
        _radioValue = 1;
     }
   else   _radioValue = 2;

 }*/
  int _radioValue = 0;
  String    hint = "Pick Your BirthDay..";

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
    this.user['birthdate'] = hint;

  }


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
  Map user = {
    'name': "",
    'email': "",
    'gender': "",
    'birthdate': "",
    'password': "",
    'address': '',
    'phone': '',
    'id': '',
  };
  DateTime currentDate = DateTime.now();
  logout()async
  {
    SharedPreferences pref = await SharedPreferences.getInstance();
    //final SharedPreferences local = await _pref;
    String token = pref.getString("token");
    var response = await http.get(connection_laravel.logout(), headers: {

      'Authorization': 'Bearer $token',
      //"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMjA0M2MwMGUwODM0NjI4OGQ5OGM0YzFlOWQwZGMzNTM0YTQ0NDlhNjIzNDYzZjliYTI0ZmJiMzVlM2EyM2NmNzNhMmZlZDlhMGQ5M2E0MTkiLCJpYXQiOjE2MTg3NjExMTIsIm5iZiI6MTYxODc2MTExMiwiZXhwIjoxNjUwMjk3MTEyLCJzdWIiOiI5Iiwic2NvcGVzIjpbXX0.n-JAspcLxqbXrkAqdb93Lchr51IUJGPOz4Dvv9kECpk9kbBqdd4yCBov606XaajAbOhO3wDifiT4h8FljmFPTK9SH6HlIEpDlq_pYMznBUsypI5WzxpyiU08zu_W1KDikLEM_4h2rHJOpxvNTgjf3tA2-vQyIv8e4uIlATJuO6qQweRNeWniAAFdZ7KmyeWPqU0YhQtY8iXXEE0QWCaxUB6YDhG6ZVOaQdJ2TND3q3I17qBJBH3DFkhArwOy-SnzjT_mPKn3S23TWzyouXcUY-p56vTa2NW6fsKGYpIgZGNyOWPgkn-9WNGDX3mV_i3Fku6SNGAWV1caaGrkBKTn657Fxrj2PrRhjPsrNziWox7SXvymXnmR1M6Ak9-PECrbaXe5sjUV8lf10dHGqfpC-fwRYEGbF26YGZh-P3IICGYlFjYCFVjBeL_3qkqqnJc7z54_hm2z_7xa39ut3u48L5xD5OEd1d0AKQc81RA0AKnhH0lD3QteS1NDw1OnJPhzedXKGxuyjrDzTv4m08k-LA-vikXJ7wFN1gR7XrxkF0DAD0I_c5Ensv48hFdvHJv7WwFP3-aEPrlwo55qsRRK3V_X_sxwEM-qYfFT9Za0erThjgQTwlRuBQta7PdJ6oJF45UMyMdJ-aHeNX9RliXP_V0HV6w8fe3JJgozZPa26Z0",
    } );
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      return jsonResponse;
    }
    //radioValue();

  }
  getProfileInfo() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    //final SharedPreferences local = await _pref;
    String token = pref.getString("token");


    var response = await http.get(connection_laravel.profile(), headers: {

      'Authorization': 'Bearer $token',
      //"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMjA0M2MwMGUwODM0NjI4OGQ5OGM0YzFlOWQwZGMzNTM0YTQ0NDlhNjIzNDYzZjliYTI0ZmJiMzVlM2EyM2NmNzNhMmZlZDlhMGQ5M2E0MTkiLCJpYXQiOjE2MTg3NjExMTIsIm5iZiI6MTYxODc2MTExMiwiZXhwIjoxNjUwMjk3MTEyLCJzdWIiOiI5Iiwic2NvcGVzIjpbXX0.n-JAspcLxqbXrkAqdb93Lchr51IUJGPOz4Dvv9kECpk9kbBqdd4yCBov606XaajAbOhO3wDifiT4h8FljmFPTK9SH6HlIEpDlq_pYMznBUsypI5WzxpyiU08zu_W1KDikLEM_4h2rHJOpxvNTgjf3tA2-vQyIv8e4uIlATJuO6qQweRNeWniAAFdZ7KmyeWPqU0YhQtY8iXXEE0QWCaxUB6YDhG6ZVOaQdJ2TND3q3I17qBJBH3DFkhArwOy-SnzjT_mPKn3S23TWzyouXcUY-p56vTa2NW6fsKGYpIgZGNyOWPgkn-9WNGDX3mV_i3Fku6SNGAWV1caaGrkBKTn657Fxrj2PrRhjPsrNziWox7SXvymXnmR1M6Ak9-PECrbaXe5sjUV8lf10dHGqfpC-fwRYEGbF26YGZh-P3IICGYlFjYCFVjBeL_3qkqqnJc7z54_hm2z_7xa39ut3u48L5xD5OEd1d0AKQc81RA0AKnhH0lD3QteS1NDw1OnJPhzedXKGxuyjrDzTv4m08k-LA-vikXJ7wFN1gR7XrxkF0DAD0I_c5Ensv48hFdvHJv7WwFP3-aEPrlwo55qsRRK3V_X_sxwEM-qYfFT9Za0erThjgQTwlRuBQta7PdJ6oJF45UMyMdJ-aHeNX9RliXP_V0HV6w8fe3JJgozZPa26Z0",
    } );
      if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
       print(response.body);
      return jsonResponse;
    }
    //radioValue();

  }
  deleteAccount(email,password) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    //final SharedPreferences local = await _pref;
    String token = pref.getString("token");
    String password = pref.getString("password");
    print(password);
    var response = await http.post(connection_laravel.deleteAccount(), headers: {


      'Authorization': 'Bearer $token',
      // "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMGY4OTJiNTc4NTc5MjIyMjdkMGVlMWU4YzcwNzcyMmNkNjVjZmM4YjhlYzBiNGZmOTY2ZWQ1ZmIyZTI0OGVlMmVkNjYzOTQ0MDVhNGIxYTMiLCJpYXQiOjE2MTg3NTI5MTQsIm5iZiI6MTYxODc1MjkxNCwiZXhwIjoxNjUwMjg4OTE0LCJzdWIiOiI2Iiwic2NvcGVzIjpbXX0.CXfE0iBuMydUg8nur4E_NFGkxZ0hRIoseCwQOsEspKaXTbiTaGkGIf871kUbH8LQC6T5EJ7K6pk74agyIhfK_PaVOYOi2aZIeqSFOF2oPGZIre5j9XLYWCeM2s-R5T3Wm6ygRCizjgDOJFeeGXGZ2CB6saGOq2mXpedy28TJiMRC31j4Ir0bxJ2c5bJ1-K0mDarAUWgzi74h_s_0F64-49uUcKiqF-o--cGl5YW3PWzmkCQwkySBohQ987B24jp0HKcyL4mPpDRrB2F7NENJqk3HivTXMefIo_hnQUg_kG9feBO8bjyoxpFgA7m6XVh_8xBs7O1940Xb77Sd1AsfdY-_NbFF3k-Z4y5KakpdYjHv04BmByFJAB5TcmizA71hRV4RaUHCm6FC-gX6Xv98yBSr2Y8c-vn4vxfJKswEOuS5VtI_Vtf1suEPEcy9J5Daig_AqcJaov4Oonwzu-CC_7NC9ldrKmgR7xNq8VOAn25GBJT3_IV6OraOLedRChjATbXgtanBm8MT1zNNLjda5IBWhvLqjqcVPtWWX48CTLwTxpKc3EninfM4vVdRUydA0ugtySr_qyTwcRgL2LtuvhLyLB3P4n2u0Uh8spiH6Zb_cVtd0S62cGsVGt4HYi28KX0TWSUHlWpBpqven6NQzxFEoNoQ3-olk07grvd4wfM"
    }, body:
    {"email":email, "password":password});

    if (response.statusCode == 200) {
      print(response.body);
      // getProfileInfo();
    }else print(response.statusCode );

  }

  updateProfile(id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    //final SharedPreferences local = await _pref;
    String token = pref.getString("token");
    print(token);
    this.user["gender"]=_gender;
    print(this.user["_gender"]);
    print(this.user["password"]);

    print (this.user);
    //this.user["password"]=password;


    //pref.setString('id', id);
    //String i=pref.get(id); print(i);
   // print(id);
   this.user["id"] = id.toString();
    var response = await http.post(connection_laravel.updateProfile(), headers: {
      'Content-Type': "application/x-www-form-urlencoded",
      'accept': 'application/json',

      'Authorization': 'Bearer $token',
     // "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMGY4OTJiNTc4NTc5MjIyMjdkMGVlMWU4YzcwNzcyMmNkNjVjZmM4YjhlYzBiNGZmOTY2ZWQ1ZmIyZTI0OGVlMmVkNjYzOTQ0MDVhNGIxYTMiLCJpYXQiOjE2MTg3NTI5MTQsIm5iZiI6MTYxODc1MjkxNCwiZXhwIjoxNjUwMjg4OTE0LCJzdWIiOiI2Iiwic2NvcGVzIjpbXX0.CXfE0iBuMydUg8nur4E_NFGkxZ0hRIoseCwQOsEspKaXTbiTaGkGIf871kUbH8LQC6T5EJ7K6pk74agyIhfK_PaVOYOi2aZIeqSFOF2oPGZIre5j9XLYWCeM2s-R5T3Wm6ygRCizjgDOJFeeGXGZ2CB6saGOq2mXpedy28TJiMRC31j4Ir0bxJ2c5bJ1-K0mDarAUWgzi74h_s_0F64-49uUcKiqF-o--cGl5YW3PWzmkCQwkySBohQ987B24jp0HKcyL4mPpDRrB2F7NENJqk3HivTXMefIo_hnQUg_kG9feBO8bjyoxpFgA7m6XVh_8xBs7O1940Xb77Sd1AsfdY-_NbFF3k-Z4y5KakpdYjHv04BmByFJAB5TcmizA71hRV4RaUHCm6FC-gX6Xv98yBSr2Y8c-vn4vxfJKswEOuS5VtI_Vtf1suEPEcy9J5Daig_AqcJaov4Oonwzu-CC_7NC9ldrKmgR7xNq8VOAn25GBJT3_IV6OraOLedRChjATbXgtanBm8MT1zNNLjda5IBWhvLqjqcVPtWWX48CTLwTxpKc3EninfM4vVdRUydA0ugtySr_qyTwcRgL2LtuvhLyLB3P4n2u0Uh8spiH6Zb_cVtd0S62cGsVGt4HYi28KX0TWSUHlWpBpqven6NQzxFEoNoQ3-olk07grvd4wfM"
     }, body:this.user);
    //{
    //   id:user["id"]
    //
    //
    //
    //   //  "password": password,
    // }
    // );

    if (response.statusCode == 200) {
      print(response.body);
      // getProfileInfo();
    }else print(response.statusCode );
  }
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.06),
      body: FutureBuilder(
        future: getProfileInfo(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
             print("hl");
             print(snapshot.hasData);
            if (snapshot.hasData) {
              var user = snapshot.data;
              return Form(
                key: _globalKey,
                child: ListView(
                  children: <Widget>[
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(vertical: 10.0),
                    //   child: Center(
                    //     child: CircleAvatar(
                    //         radius: 30,
                    //         backgroundImage: AssetImage(
                    //           "images/profile.jpg",
                    //         )),
                    //   ),
                    // ),
                    // Center(
                    //   child: Text(
                    //     user['name'],
                    //
                    //     style: TextStyle(
                    //
                    //         color: Colors.black, fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                    // Center(
                    //   child: Text(
                    //     user['address'],
                    //     style: TextStyle(color: Colors.grey, fontSize: 10),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: height * 0.02,
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Container(
                        height: height * 0.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  width: width * 0.05,
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.symmetric(vertical: 8.0),
                                //   child: CircleAvatar(
                                //       radius: 20,
                                //       backgroundImage: AssetImage(
                                //         "images/profile.jpg",
                                //       )),
                                // ),
                                // SizedBox(
                                //   width: width * 0.09,
                                // ),
                                // Container(
                                //   decoration: BoxDecoration(
                                //       borderRadius: BorderRadius.circular(3),
                                //       color: Colors.blue),
                                //   child: Center(
                                //     child: Padding(
                                //       padding: const EdgeInsets.all(8.0),
                                //       child: Text(
                                //         "Upload Photo",
                                //         style: TextStyle(color: Colors.white),
                                //       ),
                                //     ),
                                //   ),
                                // )
                              ],
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: Text(
                            //     "For best result use an image at least 256 px by 256 px in either .jpg or .png format",
                            //     style: TextStyle(color: Colors.grey),
                            //     textAlign: TextAlign.center,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(" Name *"),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Container(
                    //     height: height * 0.06,
                    //     child: TextField(
                    //       onChanged: (value) => {
                    //        //  this.user.update('name', (value) => value),
                    //         this.user['name'] = value
                    //       },
                    //       decoration: InputDecoration(
                    //           hintText: user['name'],
                    //           border: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(2),
                    //           ),
                    //           fillColor: Colors.grey.withOpacity(0.4),
                    //           filled: true),
                    //     ),
                    //   ),
                    // ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        onChanged: (value) => {
                          // this.user.update('name', (value) => value),
                          this.user['name'] = value
                        },
                        decoration: InputDecoration(
                            hintText: user['name'],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                            ),
                            fillColor: Colors.grey.withOpacity(0.4),
                            filled: true),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter a valid name';
                            }}
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Email *"),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        onChanged: (value) => {
                          // this.user.update('email', (value) => value)
                          this.user['email'] = value
                        },
                        decoration: InputDecoration(
                            hintText: user['email'],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                            ),
                            fillColor: Colors.grey.withOpacity(0.4),
                            filled: true),

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
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: <Widget>[
                          Text("Gender:"),
                          SizedBox(width: 10,),
                          Text(

                            user['gender'],

                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 17.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[

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
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("Birthday *"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: height * 0.06,
                        child: TextField(

                          decoration: InputDecoration(
                              hintText: user['birthdate'],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2),
                              ),
                              fillColor: Colors.grey.withOpacity(0.4),
                              filled: true),
                        ),
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
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("Address *"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        onChanged: (value) => {
                          // this.user.update('birthdate', (value) => value)
                          this.user['address'] = value
                        },
                        decoration: InputDecoration(
                            hintText: user['address'],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                            ),
                            fillColor: Colors.grey.withOpacity(0.4),
                            filled: true),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter a valid address';
                            }}
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("Phone *"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        onChanged: (value) => {
                          // this.user.update('birthdate', (value) => value)
                          this.user['phone'] = value
                        },
                        decoration: InputDecoration(
                            hintText: user['phone'],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                            ),
                            fillColor: Colors.grey.withOpacity(0.4),
                            filled: true),
                          validator: (value) {

                              String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                              RegExp regExp = new RegExp(pattern);
                              if (value.length < 8) {
                                return 'Please enter mobile number';
                              }
                              else if (!regExp.hasMatch(value)) {
                                return 'Please enter valid mobile number';
                              }
                              return null;
                            }

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("Password *"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (v) {
                          if (v.isEmpty) {
                            return 'Enter a valid password!';
                            print('jjjj');
                          }

                          else if (v.trim().length < 8) {
                            return 'this password is too short';
                          }
                        },
                        onChanged: (value) => {
                         // this.user.update('password', (value) => value)
                          this.user['phone'] = value
                        },
                        decoration: InputDecoration(
                            hintText: "*************",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                            ),
                            fillColor: Colors.grey.withOpacity(0.4),
                            filled: true),
                      ),
                    ),
                    // Center(
                    //   child: Text(
                    //     "Delete Account",
                    //     style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 120.0),
                    //   child: FlatButton(
                    //       color: Colors.red,
                    //       shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(5)),
                    //       onPressed: () async {
                    //         print(user['email']);
                    //         print(this.user['password']);
                    //
                    //         // await AuthService().deleteUser(email, password);
                    //         await deleteAccount(user['email'],this.user['password']);
                    //         Navigator.of(context).pop(
                    //
                    //           //repo.unsetLocalToken(token);
                    //
                    //             MaterialPageRoute(builder: (context) => loginn()));
                    //       },
                          // child: Center(
                          //
                          //   child: Text(
                          //     "Delete Account",
                          //     style: TextStyle(
                          //         color: Colors.white, fontWeight: FontWeight.bold),
                          //   ),
                          // )
                      //),
                    //),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 120.0),
                      child: FlatButton(
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          onPressed: () async {
    if (_globalKey.currentState.validate()) {
      await updateProfile(user['id']);
    }
                            // FirebaseUser user =
                            // await FirebaseAuth.instance.currentUser();
                            // await user.updateEmail(email);
                            // await user.updatePassword(password);
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => ShowProfile(user: user),),);
                          },
                          child: Center(
                            child: Text(
                              "Apply",
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
                          onPressed: () async{
                            await logout();

                            Navigator.of(context).pop(


                              //repo.unsetLocalToken(token);

                                MaterialPageRoute(builder: (context) => loginn()));
                          },
                          child: Center(
                            child: Row(
                              children: [
                                Text(
                                  "Logout         ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(
                                  Icons.navigation,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        )
                    ),
                  ],
                ),
              );
            }
            return Center( child: CircularProgressIndicator());
          }),
    );
  }
}
