import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meal_ware/features/home/data/models/meal_model.dart';
import 'package:meal_ware/features/home/domain/entity/meal_entity.dart';

abstract class FavoritesDatasource {
  Future<void> addFavorite(String userId, MealModel meal);
  Future<List<MealModel>> getFavorites(String userId);
  Future<void> removeFavorite(String userId, String mealId);
}

class FavoritesDatasourceImp extends FavoritesDatasource {
  final FirebaseFirestore firestore;

  FavoritesDatasourceImp({required this.firestore});

  @override
  Future<void> addFavorite(String userId, MealModel meal) async {
    final favoriteDoc = firestore
        .collection('users')
        .doc(userId)
        .collection('favorites')
        .doc();

    final mealData = {
      'id': favoriteDoc.id, // Assign Firestore-generated ID manually
      'title': meal.title,
      'category': meal.category,
      'imgUrl': meal.imgUrl,
      'prepTime': meal.prepTime,
      'summary': meal.summary,
      'ingredients': meal.ingredients,
      'directions': meal.directions,
      'nutrients': meal.nutrients,
    };

    await favoriteDoc.set(mealData);
  }

  @override
  Future<List<MealModel>> getFavorites(String userId) async {
    final snapshot = await firestore
        .collection('users')
        .doc(userId)
        .collection('favorites')
        .get();

    return snapshot.docs.map((doc) {
      final data = doc.data();
      return MealCreationReq(
        id: data['id'],
        title: data['title'],
        category: data['category'],
        imgUrl: data['imgUrl'],
        prepTime: data['prepTime'],
        summary: data['summary'],
        ingredients: List<String>.from(data['ingredients'] ?? []),
        directions: List<String>.from(data['directions'] ?? []),
        nutrients: Map<String, dynamic>.from(data['nutrients'] ?? {}),
      );
    }).toList();
  }

  @override
  Future<void> removeFavorite(String userId, String mealId) async {
    final favoriteDoc = firestore
        .collection('users')
        .doc(userId)
        .collection('favorites')
        .doc(mealId);

    await favoriteDoc.delete();
  }
}
