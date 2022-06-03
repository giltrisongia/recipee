// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:recipee/categorypage.dart';
import 'package:recipee/constant/color.dart';
import 'package:recipee/homepage.dart';
import 'package:recipee/infopage.dart';

class NavBar extends StatefulWidget {
  const NavBar({ Key? key }) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: null,
      body: DefaultTabController(
        length: 3, 
        child: Stack(
          children: <Widget> [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
            ),
            Scaffold(
              bottomNavigationBar: Padding(
                padding: EdgeInsets.only(bottom:15),
                child: TabBar(
                  tabs: <Widget>[
                    Tab(icon: Icon(Icons.home),),
                    Tab(icon: Icon(Icons.category),),
                    Tab(icon: Icon(Icons.info),),
                  ],
                  labelColor: primaryColor,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(color: primaryColor,width: 4.0),
                    insets: EdgeInsets.only(bottom:44)
                    ),
                    unselectedLabelColor: grey,
                ),
              ),
              body: TabBarView(
                children:<Widget> [
                  HomePage(),
                  CategoryPage(),
                  InfoPage(),
                ],) ,
            )
          ],
        )
      ),
    );
  }
}