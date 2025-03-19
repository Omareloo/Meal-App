import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meal_ware/features/home/domain/entity/meal_entity.dart';

class MealCreationReq extends MealModel {
  MealCreationReq({
    required final String id,
    required final String title,
    required final String category,
    required final String imgUrl,
    required final int prepTime,
    required final String summary,
    required final List<String> ingredients,
    required final List<String> directions,
    required final Map<String, dynamic> nutrients,
  }) : super(
        id: id,
        title: title,
        category: category,
        imgUrl: imgUrl,
        prepTime: prepTime,
        summary: summary,
        ingredients: ingredients,
        directions: directions,
        nutrients: nutrients,
      );
 

  factory MealCreationReq.fromSnaoshot(DocumentSnapshot snapshot) {
    return MealCreationReq(
        id: snapshot.get('id'),
        title: snapshot.get('title'),
        category: snapshot.get('category'),
        imgUrl: snapshot.get('imgUrl'),
        prepTime: snapshot.get('prepTime'),
        summary: snapshot.get('summary'),
        ingredients: snapshot.get('ingredients'),
        directions: snapshot.get('directions'),
        nutrients: snapshot.get('nutrients'),
    );
  }

  Map<String, dynamic> toDocument() {
    return {
        "id": id,
        "title": title,
        "category": category,
        "imgUrl": imgUrl,
        "prepTime": prepTime,
        "summary": summary,
        "ingredients": ingredients,
        "directions": directions,
        "nutrients": nutrients
    };
  }
  
}