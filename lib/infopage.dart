import 'package:flutter/material.dart';
import 'package:recipee/constant/color.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: whiteNeutral,
        centerTitle: true,
        title: Text(
          'About',
          style: TextStyle(
            fontSize: 20,
            fontFamily: "Poppins",
            color: primaryColor,
          ),
        ),
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Recipee App by:",
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins"),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Giltri Songia Rafel',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: "Poppins"
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
