import 'package:chat_bot/home.dart';
import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';

class DetailsPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String details;
  final int index;
  final String rowImages;
  final String pic1;
  final String pic2;
  final String pic3;
  final String pic4;
  final String pic5;
  final String pic6;
  DetailsPage(
      {@required this.imagePath,
        @required this.title,
        @required this.details,
        @required this.index,
        @required this.rowImages,
        @required this.pic1,
        @required this.pic2,
        @required this.pic3,
        @required this.pic4,
        @required this.pic5,
        @required this.pic6,
      });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        child: Column(

          children: <Widget>[
            Expanded(
              child: Hero(
                tag: 'logo$index',
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    image: DecorationImage(
                      image: AssetImage(rowImages),


                      fit: BoxFit.cover,
                    ),
                  ),
                ),

              ),

            ),


            Container(

              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          title,
                          style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          details,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),

                      ],
                    ),

                  ),
                  SizedBox(height: 10,),

                  Row(


                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(

                          width: 150,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(5.0),
                            child: Image(
                              fit: BoxFit.contain,
                              alignment: Alignment.topRight,
                              image: AssetImage(pic1),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50,width: 50,),

                      Container(
                        width: 150,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(5.0),
                          child: Image(
                            fit: BoxFit.contain,
                            alignment: Alignment.topRight,
                            image: AssetImage(pic2),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          width: 150,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(5.0),
                            child: Image(
                              fit: BoxFit.contain,
                              alignment: Alignment.topRight,
                              image: AssetImage(pic3),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50,width: 50,),
                      Container(
                        width: 150,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(5.0),
                          child: Image(
                            fit: BoxFit.contain,
                            alignment: Alignment.topRight,
                            image: AssetImage(pic4),
                          ),
                        ),
                      ),

                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          width: 150,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(5.0),
                            child: Image(
                              fit: BoxFit.contain,
                              alignment: Alignment.topRight,
                              image: AssetImage(pic5),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50,width: 50,),

                      Container(
                        width: 150,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(5.0),
                          child: Image(
                            fit: BoxFit.contain,
                            alignment: Alignment.topRight,
                            image: AssetImage(pic6),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          padding: EdgeInsets.symmetric(vertical: 15),
                          color: Colors.lightBlueAccent,
                          child: Text(
                            'Back',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        width: 15,
                      ),

                    ],
                  )
                ],
              ),

            ),
          ],
        ),
      ),
    );
  }
}