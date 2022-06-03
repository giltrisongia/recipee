// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

ResFoodByCategory resFoodByCategoryFromJson(String str) => ResFoodByCategory.fromJson(json.decode(str));

String resFoodByCategoryToJson(ResFoodByCategory data) => json.encode(data.toJson());

class ResFoodByCategory {
  ResFoodByCategory({
    this.meals,
  });

  List<Meal>? meals;

  factory ResFoodByCategory.fromJson(Map<String, dynamic> json) => ResFoodByCategory(
    meals: json["meals"] == null ? null : List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "meals": meals == null ? null : List<dynamic>.from(meals!.map((x) => x.toJson())),
  };
}

class Meal {
  Meal({
    required this.strMeal,
    required this.strMealThumb,
    required this.idMeal,
  });

  String strMeal;
  String strMealThumb;
  String idMeal;

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
    strMeal: json["strMeal"] == null ? null : json["strMeal"],
    strMealThumb: json["strMealThumb"] == null ? null : json["strMealThumb"],
    idMeal: json["idMeal"] == null ? null : json["idMeal"],
  );

  Map<String, dynamic> toJson() => {
    "strMeal": strMeal,
    "strMealThumb": strMealThumb,
    "idMeal": idMeal,
  };
}