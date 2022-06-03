// ignore_for_file: must_be_immutable

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'constant/color.dart';

class DetailFoodRecipe extends StatefulWidget {
  var idMeal;
  DetailFoodRecipe({Key? key, this.idMeal});

  @override
  _DetailFoodRecipeState createState() => _DetailFoodRecipeState();
}

class _DetailFoodRecipeState extends State<DetailFoodRecipe> {

  var meal;
  bool loading = false;

  Future<void> getDetailFood()async{
    setState(() {
      loading = true;
    });

    http.Response  res = await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/lookup.php?i=${widget.idMeal}'));

    setState(() {
      loading = false;
    });

    if(res.statusCode == 200){
      var detailFood = jsonDecode(res.body);
      log(res.body);

      if(detailFood['meals']!= null){
        setState(() {
          meal = detailFood['meals'][0];

        });
      }
      else{
        print('failed');
      }
    }

  }
  @override
  void initState() {
    getDetailFood();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     if(loading) {
       return Container(
         height: double.infinity,
         width: double.infinity,
         color: whiteNeutral,
         child: Center(
           child: CircularProgressIndicator(color: primaryColor,),
         ),
       );
     }
      return Scaffold(
        backgroundColor: whiteNeutral,
        appBar: AppBar(
          elevation: 0,
          title: Text(
            '${meal['strMeal']}',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                color: darkenColor,
            ),
          ),
          backgroundColor: whiteNeutral,
          centerTitle: true,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: darkenColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        '${meal['strMealThumb']}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  '${meal['strMeal']}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Libre',
                      color: darkenColor,
                      fontSize: 28),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      '${meal['strArea']}',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          color: grey,
                          fontSize: 16),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      '${meal['strCategory']}',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          color: grey,
                          fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 10,),

                Text(
                  'Ingredient',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      color: darkenColor,
                      fontSize: 16),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    if (meal['strIngredient1'] != null &&
                        meal['strIngredient1'] != '')
                      Text(
                          '• ${meal['strMeasure1'] ?? ""} ${meal['strIngredient1'] ?? ""} '),


                    if (meal['strIngredient2'] != null &&
                        meal['strIngredient2'] != '')
                      Text(
                          '• ${meal['strMeasure2'] ?? ""} ${meal['strIngredient2'] ?? ""} '),

                    if (meal['strIngredient3'] != null &&
                        meal['strIngredient3'] != '')
                      Text(
                          '• ${meal['strMeasure3'] ?? ""} ${meal['strIngredient3'] ?? ""} '),

                    if (meal['strIngredient4'] != null &&
                        meal['strIngredient4'] != '')
                      Text(
                          '• ${meal['strMeasure4'] ?? ""} ${meal['strIngredient4'] ?? ""}  '),

                    if (meal['strIngredient5'] != null &&
                        meal['strIngredient5'] != '')
                      Text(
                          '• ${meal['strMeasure5'] ?? ""} ${meal['strIngredient5'] ?? ""} '),

                    if (meal['strIngredient6'] != null &&
                        meal['strIngredient6'] != '')
                      Text(
                          '• ${meal['strMeasure6'] ?? ""} ${meal['strIngredient6'] ?? ""} '),

                    if (meal['strIngredient7'] != null &&
                        meal['strIngredient7'] != '')
                      Text(
                          '• ${meal['strMeasure7'] ?? ""} ${meal['strIngredient7'] ?? ""} '),

                    if (meal['strIngredient8'] != null &&
                        meal['strIngredient8'] != '')
                      Text(
                          '• ${meal['strMeasure8'] ?? ""} ${meal['strIngredient8'] ?? ""} '),

                    if (meal['strIngredient9'] != null &&
                        meal['strIngredient9'] != '')
                      Text(
                          '• ${meal['strMeasure9'] ?? ""} ${meal['strIngredient9'] ?? ""} '),

                    if (meal['strIngredient10'] != null &&
                        meal['strIngredient10'] != '')
                      Text(
                          '• ${meal['strMeasure10'] ?? ""} ${meal['strIngredient10'] ?? ""} '),

                    if (meal['strIngredient11'] != null &&
                        meal['strIngredient11'] != '')
                      Text(
                          '• ${meal['strMeasure11'] ?? ""} ${meal['strIngredient11'] ?? ""} '),

                    if (meal['strIngredient12'] != null &&
                        meal['strIngredient12'] != '')
                      Text(
                          '• ${meal['strMeasure12'] ?? ""} ${meal['strIngredient12'] ?? ""} '),

                    if (meal['strIngredient13'] != null &&
                        meal['strIngredient13'] != '')
                      Text(
                          '• ${meal['strMeasure13'] ?? ""} ${meal['strIngredient13'] ?? ""}  '),

                    if (meal['strIngredient14'] != null &&
                        meal['strIngredient14'] != '')
                      Text(
                          '• ${meal['strMeasure14'] ?? ""} ${meal['strIngredient14'] ?? ""} '),

                    if (meal['strIngredient15'] != null &&
                        meal['strIngredient15'] != '')
                      Text(
                          '• ${meal['strMeasure15'] ?? ""} ${meal['strIngredient15'] ?? ""} '),

                    if (meal['strIngredient16'] != null &&
                        meal['strIngredient16'] != '')
                      Text(
                          '• ${meal['strMeasure16'] ?? ""} ${meal['strIngredient16'] ?? ""} '),

                    if (meal['strIngredient17'] != null &&
                        meal['strIngredient17'] != '')
                      Text(
                          '• ${meal['strMeasure17'] ?? ""} ${meal['strIngredient17'] ?? ""} '),

                    if (meal['strIngredient18'] != null &&
                        meal['strIngredient18'] != '')
                      Text(
                          '• ${meal['strMeasure18'] ?? ""} ${meal['strIngredient18'] ?? ""} '),

                    if (meal['strIngredient19'] != null &&
                        meal['strIngredient19'] != '')
                      Text(
                          '• ${meal['strMeasure19'] ?? ""} ${meal['strIngredient19'] ?? ""} '),

                    if (meal['strIngredient20'] != null &&
                        meal['strIngredient20'] != '')
                      Text(
                          '• ${meal['strMeasure20'] ?? ""} ${meal['strIngredient20'] ?? ""} '),
                
                SizedBox(height: 10,),
                Text(
                  'Instructions',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      color: darkenColor,
                      fontSize: 16),
                ),

                Text(
                  '${meal['strInstructions']}',
                  style: TextStyle(
                      color: darkenColor),
                ),
                  ],
                ),


              ],
            ),
          ),
        ),
      );
    }
  }