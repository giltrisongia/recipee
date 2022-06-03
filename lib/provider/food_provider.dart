import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class FoodProvider extends ChangeNotifier{

  List listCategoryFood = [];
  var itemCategory;
  bool loadingCategory = true;

  List listAreaFood = [];
  var itemArea;
  bool loadingArea = true;

  List listFoodByArea = [];
  var itemByArea;
  bool loadingfoodbyArea = true;

  String? kodeArea;





  FoodProvider(){
    this.getCategoryFood();
    this.getAreaFood();
  }

  Future<void> getCategoryFood()async{
    loadingCategory = true;
    notifyListeners();
    http.Response res = await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php'));

    loadingCategory = false;
    notifyListeners();

    if(res.statusCode==200){
      var dataCategory = jsonDecode(res.body);
      listCategoryFood = dataCategory['categories'];
      log(res.body);
      notifyListeners();

    }else{
      print('failed');
    }

  }

  Future<void> getAreaFood()async{
    loadingArea = true;
    notifyListeners();
    http.Response res = await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/list.php?a=list'));

    loadingArea = false;
    notifyListeners();

    if(res.statusCode==200){
      var dataArea = jsonDecode(res.body);
      listAreaFood = dataArea['meals'];
      log(res.body);
      notifyListeners();

      if(kodeArea == null){
        if(listAreaFood.isNotEmpty){
          kodeArea = listAreaFood.first['strArea'];
          getFoodByArea(kodeArea!);
        }
      }

    }else{
      print('failed');
    }

  }

  Future<void> getFoodByArea(String area)async{
    loadingfoodbyArea = true;
    notifyListeners();
    http.Response res = await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/filter.php?a=${area}'));

    loadingfoodbyArea = false;
    notifyListeners();

    if(res.statusCode==200){
      var dataByArea = jsonDecode(res.body);
      listFoodByArea = dataByArea['meals'];
      log(res.body);
      notifyListeners();

    }else{
      print('failed');
    }

  }


}