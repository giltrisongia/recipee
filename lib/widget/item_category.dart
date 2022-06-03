import 'package:flutter/material.dart';

Widget itemCatMeal() {
  return Scaffold(
    body: Stack(
      children: [
        Container(
          child: Image.asset(
            'assets/image/breakfast.jpg',
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.black.withOpacity(0.1),
          child: Text(
            'strCategory',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        )
      ],
    ),
  );
}