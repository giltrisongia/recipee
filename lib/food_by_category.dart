// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recipee/detail_food.dart';
import 'package:http/http.dart'as http;
import 'package:recipee/model/res_category_food.dart';

import 'constant/color.dart';

class FoodByCategoryPage extends StatefulWidget {
  var imageCat, nameCat;

  FoodByCategoryPage({Key? key, this.imageCat, this.nameCat}) : super(key: key);



  @override
  _FoodByCategoryPageState createState() => _FoodByCategoryPageState();
}

class _FoodByCategoryPageState extends State<FoodByCategoryPage> {

  Future<List<Meal>> getListByCategory(String category) async{
    List<Meal> listMeal = [];

    final response = await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/filter.php?c=${category}'));

    if(response.statusCode == 200){
      final meal =jsonDecode(response.body);

      ResFoodByCategory resFoodByCategory = ResFoodByCategory.fromJson(meal);

      resFoodByCategory.meals!.forEach((item) {

        listMeal.add(item);

      });
      return listMeal;


    }else{
      return[];

    }



  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Category',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Libre',
              color: darkenColor,
              fontSize: 20),
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
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 125,
                  child: Image.network(
                    widget.imageCat,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 125,
                  alignment: Alignment.center,
                  color: Colors.black.withOpacity(0.1),
                  child: Text(
                    widget.nameCat,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Libre',
                      fontWeight: FontWeight.bold,
                      color: whiteNeutral,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: FutureBuilder<List<Meal>>(
                future: getListByCategory(widget.nameCat),
                builder: (context,snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(
                      child: Text('Loading..')
                    );
                  }else{
                    List<Meal>? listMeal = snapshot.data;
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index){
                          return itemFoodByCategory(listMeal![index]);
                        });

                  }
                },

            ))


          ],
        ),
      ),
    );
  }
  Widget itemFoodByCategory(Meal meal){
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailFoodRecipe(idMeal: meal.idMeal,)));

      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          height: 100,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(meal.strMealThumb,
                  height:  100,
                  width: 100,
                  fit: BoxFit.cover,),
              ),
              Padding(padding: EdgeInsets.all(10),
                child: Text(meal.strMeal),)
            ],
          ),
        ),
      ),
    );
  }
}