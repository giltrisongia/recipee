import 'dart:async';

import 'package:flutter/material.dart';
import 'package:recipee/constant/color.dart';
import 'package:recipee/nav.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    Timer(const Duration(seconds: 5), () async {
      Navigator.push(
          // ignore: prefer_const_constructors
          context, MaterialPageRoute(builder: (context) => NavBar()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: Center(
          child: Image.asset('assets/image/icon.png'),
        ));
  }
}
