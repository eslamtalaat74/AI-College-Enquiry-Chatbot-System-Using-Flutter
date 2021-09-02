
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}
class _AboutPageState extends State<AboutPage> {
  Future<void> launched;
  String _osfaceurl= 'https://www.facebook.com/0.OsamaYousef';
  Future<void> _launchInBrowser(String url)async{
    if(await canLaunch(url))
    {
      await launch(url,
          forceSafariVC: true,
          forceWebView: false,
          headers: <String,String>{'header_key':'header_value'});
    }
  }

  Future<void> _launchInApp(String url)async{
    if(await canLaunch(url))
    {
      await launch(url,
          forceSafariVC: true,
          forceWebView: false,
          headers: <String,String>{'header_key':'header_value'});
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: new FittedBox(
                child: Material(
                  color: Colors.white,
                  elevation: 12.0,
                  borderRadius: BorderRadius.circular(24.0),
                  shadowColor: Color(0xf0a05f06),
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Padding(

                          padding: const EdgeInsets.only(left: 16.0),
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                Text("Ahmed Moheb",style: TextStyle(
                                    fontSize:20,
                                    color: Colors.blue
                                ),
                                ),
                                Row(
                                  children: [
                                    IconButton(icon: Icon(FontAwesomeIcons.facebook,color: Colors.blue,),
                                      onPressed:(){_launchInBrowser(_osfaceurl);} ,),
                                    SizedBox(width: 10,),
                                    IconButton(icon:Icon(FontAwesomeIcons.envelope,color: Colors.red),
                                      onPressed:(){_launchInBrowser(_osfaceurl);} ,),
                                    SizedBox(width: 10,),
                                    IconButton(icon:Icon(FontAwesomeIcons.twitter,color: Colors.lightBlue),
                                      onPressed:(){_launchInBrowser(_osfaceurl);} ,),
                                  ],
                                )
                              ],
                            ),


                          ),
                        ),

                      ),
                      Container(
                        width: 250,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(24.0),
                          child: Image(
                            fit: BoxFit.contain,
                            alignment: Alignment.topRight,
                            image: AssetImage("images/ahmed.jpg"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: new FittedBox(
                child: Material(
                  color: Colors.white,
                  elevation: 12.0,
                  borderRadius: BorderRadius.circular(24.0),
                  shadowColor: Color(0xf0a05f06),
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Padding(

                          padding: const EdgeInsets.only(left: 16.0),
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                Text("Osama Mahmoud",style: TextStyle(
                                    fontSize:20,
                                    color: Colors.blue
                                ),
                                ),
                                Row(
                                  children: [

                                    IconButton(icon: Icon(FontAwesomeIcons.facebook,color: Colors.blue,),
                                      onPressed:(){_launchInBrowser(_osfaceurl);} ,),
                                    SizedBox(width: 10,),
                                    IconButton(icon:Icon(FontAwesomeIcons.envelope,color: Colors.red),
                                      onPressed:(){_launchInBrowser(_osfaceurl);} ,),
                                    SizedBox(width: 10,),
                                    IconButton(icon:Icon(FontAwesomeIcons.twitter,color: Colors.lightBlue),
                                      onPressed:(){_launchInBrowser(_osfaceurl);} ,),
                                  ],
                                )
                              ],
                            ),


                          ),
                        ),

                      ),
                      Container(
                        width: 250,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(24.0),
                          child: Image(
                            fit: BoxFit.contain,
                            alignment: Alignment.topRight,
                            image: AssetImage("images/os.jpg"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: new FittedBox(
                child: Material(
                  color: Colors.white,
                  elevation: 12.0,
                  borderRadius: BorderRadius.circular(24.0),
                  shadowColor: Color(0xf0a05f06),
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Padding(

                          padding: const EdgeInsets.only(left: 16.0),
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                Text("Eslam Talaat",style: TextStyle(
                                    fontSize:20,
                                    color: Colors.blue
                                ),
                                ),
                                Row(
                                  children: [
                                    IconButton(icon: Icon(FontAwesomeIcons.facebook,color: Colors.blue,),
                                      onPressed:(){_launchInBrowser(_osfaceurl);} ,),
                                    SizedBox(width: 10,),
                                    IconButton(icon:Icon(FontAwesomeIcons.envelope,color: Colors.red),
                                      onPressed:(){_launchInBrowser(_osfaceurl);} ,),
                                    SizedBox(width: 10,),
                                    IconButton(icon:Icon(FontAwesomeIcons.twitter,color: Colors.lightBlue),
                                      onPressed:(){_launchInBrowser(_osfaceurl);} ,),
                                  ],
                                )
                              ],
                            ),


                          ),
                        ),

                      ),
                      Container(
                        width: 250,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(24.0),
                          child: Image(
                            fit: BoxFit.contain,
                            alignment: Alignment.topRight,
                            image: AssetImage("images/eslam.jpg"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: new FittedBox(
                child: Material(
                  color: Colors.white,
                  elevation: 12.0,
                  borderRadius: BorderRadius.circular(24.0),
                  shadowColor: Color(0xf0a05f06),
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Padding(

                          padding: const EdgeInsets.only(left: 16.0),
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                Text("Henish Al Araby",style: TextStyle(
                                    fontSize:20,
                                    color: Colors.blue
                                ),
                                ),
                                Row(
                                  children: [
                                    IconButton(icon: Icon(FontAwesomeIcons.facebook,color: Colors.blue,),
                                      onPressed:(){_launchInBrowser(_osfaceurl);} ,),
                                    SizedBox(width: 10,),
                                    IconButton(icon:Icon(FontAwesomeIcons.envelope,color: Colors.red),
                                      onPressed:(){_launchInBrowser(_osfaceurl);} ,),
                                    SizedBox(width: 10,),
                                    IconButton(icon:Icon(FontAwesomeIcons.twitter,color: Colors.lightBlue),
                                      onPressed:(){_launchInBrowser(_osfaceurl);} ,),
                                  ],
                                )
                              ],
                            ),


                          ),
                        ),

                      ),
                      Container(
                        width: 250,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(24.0),
                          child: Image(
                            fit: BoxFit.contain,
                            alignment: Alignment.topRight,
                            image: AssetImage("images/henish.jpg"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: new FittedBox(
                child: Material(
                  color: Colors.white,
                  elevation: 12.0,
                  borderRadius: BorderRadius.circular(24.0),
                  shadowColor: Color(0xf0a05f06),
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Padding(

                          padding: const EdgeInsets.only(left: 16.0),
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                Text("Ebram Eid",style: TextStyle(
                                    fontSize:20,
                                    color: Colors.blue
                                ),
                                ),
                                Row(
                                  children: [
                                    IconButton(icon: Icon(FontAwesomeIcons.facebook,color: Colors.blue,),
                                      onPressed:(){_launchInBrowser(_osfaceurl);} ,),
                                    SizedBox(width: 10,),
                                    IconButton(icon:Icon(FontAwesomeIcons.envelope,color: Colors.red),
                                      onPressed:(){_launchInBrowser(_osfaceurl);} ,),
                                    SizedBox(width: 10,),
                                    IconButton(icon:Icon(FontAwesomeIcons.twitter,color: Colors.lightBlue),
                                      onPressed:(){_launchInBrowser(_osfaceurl);} ,),
                                  ],
                                )
                              ],
                            ),


                          ),
                        ),

                      ),
                      Container(
                        width: 250,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(24.0),
                          child: Image(
                            fit: BoxFit.contain,
                            alignment: Alignment.topRight,
                            image: AssetImage("images/ebram.jpg"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: new FittedBox(
                child: Material(
                  color: Colors.white,
                  elevation: 12.0,
                  borderRadius: BorderRadius.circular(24.0),
                  shadowColor: Color(0xf0a05f06),
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Padding(

                          padding: const EdgeInsets.only(left: 16.0),
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                Text("Mohamed Helmy",style: TextStyle(
                                    fontSize:20,
                                    color: Colors.blue
                                ),
                                ),
                                Row(
                                  children: [
                                    IconButton(icon: Icon(FontAwesomeIcons.facebook,color: Colors.blue,),
                                      onPressed:(){_launchInBrowser(_osfaceurl);} ,),
                                    SizedBox(width: 10,),
                                    IconButton(icon:Icon(FontAwesomeIcons.envelope,color: Colors.red),
                                      onPressed:(){_launchInBrowser(_osfaceurl);} ,),
                                    SizedBox(width: 10,),
                                    IconButton(icon:Icon(FontAwesomeIcons.twitter,color: Colors.lightBlue),
                                      onPressed:(){_launchInBrowser(_osfaceurl);} ,),
                                  ],
                                )
                              ],
                            ),


                          ),
                        ),

                      ),
                      Container(
                        width: 250,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(24.0),
                          child: Image(
                            fit: BoxFit.contain,
                            alignment: Alignment.topRight,
                            image: AssetImage("images/Helmy.png"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: new FittedBox(
                child: Material(
                  color: Colors.white,
                  elevation: 12.0,
                  borderRadius: BorderRadius.circular(24.0),
                  shadowColor: Color(0xf0a05f06),
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Padding(

                          padding: const EdgeInsets.only(left: 16.0),
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                Text("Mostafa Mahmoud",style: TextStyle(
                                    fontSize:20,
                                    color: Colors.blue
                                ),
                                ),
                                Row(
                                  children: [
                                    IconButton(icon: Icon(FontAwesomeIcons.facebook,color: Colors.blue,),
                                      onPressed:(){_launchInBrowser(_osfaceurl);} ,),
                                    SizedBox(width: 10,),
                                    IconButton(icon:Icon(FontAwesomeIcons.envelope,color: Colors.red),
                                      onPressed:(){_launchInBrowser(_osfaceurl);} ,),
                                    SizedBox(width: 10,),
                                    IconButton(icon:Icon(FontAwesomeIcons.twitter,color: Colors.lightBlue),
                                      onPressed:(){_launchInBrowser(_osfaceurl);} ,),
                                  ],
                                )
                              ],
                            ),


                          ),
                        ),

                      ),
                      Container(
                        width: 250,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(24.0),
                          child: Image(
                            fit: BoxFit.contain,
                            alignment: Alignment.topRight,
                            image: AssetImage("images/mostafa.jpg"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: new FittedBox(
                child: Material(
                  color: Colors.white,
                  elevation: 12.0,
                  borderRadius: BorderRadius.circular(24.0),
                  shadowColor: Color(0xf0a05f06),
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Padding(

                          padding: const EdgeInsets.only(left: 16.0),
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                Text("Romany Atef",style: TextStyle(
                                    fontSize:20,
                                    color: Colors.blue
                                ),
                                ),
                                Row(
                                  children: [
                                    IconButton(icon: Icon(FontAwesomeIcons.facebook,color: Colors.blue,),
                                      onPressed:(){_launchInBrowser(_osfaceurl);} ,),
                                    SizedBox(width: 10,),
                                    IconButton(icon:Icon(FontAwesomeIcons.envelope,color: Colors.red),
                                      onPressed:(){_launchInBrowser(_osfaceurl);} ,),
                                    SizedBox(width: 10,),
                                    IconButton(icon:Icon(FontAwesomeIcons.twitter,color: Colors.lightBlue),
                                      onPressed:(){_launchInBrowser(_osfaceurl);} ,),
                                  ],
                                )
                              ],
                            ),


                          ),
                        ),

                      ),
                      Container(
                        width: 250,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(24.0),
                          child: Image(
                            fit: BoxFit.contain,
                            alignment: Alignment.topRight,
                            image: AssetImage("images/romany.png"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: new FittedBox(
                child: Material(
                  color: Colors.white,
                  elevation: 12.0,
                  borderRadius: BorderRadius.circular(24.0),
                  shadowColor: Color(0xf0a05f06),
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Padding(

                          padding: const EdgeInsets.only(left: 16.0),
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                Text("Ali Mohamed",style: TextStyle(
                                    fontSize:20,
                                    color: Colors.blue
                                ),
                                ),
                                Row(
                                  children: [
                                    IconButton(icon: Icon(FontAwesomeIcons.facebook,color: Colors.blue,),
                                      onPressed:(){_launchInBrowser(_osfaceurl);} ,),
                                    SizedBox(width: 10,),
                                    IconButton(icon:Icon(FontAwesomeIcons.envelope,color: Colors.red),
                                      onPressed:(){_launchInBrowser(_osfaceurl);} ,),
                                    SizedBox(width: 10,),
                                    IconButton(icon:Icon(FontAwesomeIcons.twitter,color: Colors.lightBlue),
                                      onPressed:(){_launchInBrowser(_osfaceurl);} ,),
                                  ],
                                )
                              ],
                            ),


                          ),
                        ),

                      ),
                      Container(
                        width: 250,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(24.0),
                          child: Image(
                            fit: BoxFit.contain,
                            alignment: Alignment.topRight,
                            image: AssetImage("images/ali.png"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

    );
  }
}
