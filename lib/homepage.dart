// ignore_for_file: prefer_const_constructors, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipee/constant/color.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              padding: EdgeInsets.only(left: 40, top: 50, right: 20),
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      gradient1,
                      gradient2,
                    ]),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      child: Stack(
                    children: <Widget>[
                      SvgPicture.asset("assets/image/look.svg",
                          width: 150,
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.bottomCenter),
                      Positioned(
                        top: 45,
                        left: 170,
                        child: Text(
                          "Find recipes \nthat fit \nyour needs",
                          style: TextStyle(
                              color: whiteNeutral,
                              fontSize: 20,
                              fontFamily: 'Poppins'),
                        ),
                      ),
                      Container(),
                    ],
                  ))
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Overview",
                  style: TextStyle(
                      fontFamily: 'Poppins', fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 30,
                  color: shadowColor,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Counter(color: primaryColor,
                number: 574,
                title: "Ingredients"
                ),
                Counter(color: primaryColor,
                number: 283,
                title: "Total Recipes"
                ),
                Counter(color: primaryColor,
                number: 27,
                title: "Food Origins"
                ),
              ],
            ),
            
          )
        ],
      ),
    );
  }
}

class Counter extends StatelessWidget {
  final int number;
  final Color color;
  final String title;
  const Counter({
    Key? key, required this.number, required this.color, required this.title, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(8),
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(
                  color: color,
                  width: 2,
                )),
          ),
        ),
        SizedBox(height: 8),
        Text(
          "$number",
          style: TextStyle(
            fontSize: 20,
            color: color,
          ),
        ),
        Text(
          title,
          style: TextStyle(color: darkColor),
        )
      ],
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
