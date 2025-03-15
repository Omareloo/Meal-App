import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meal_ware/features/home/data/models/meal_model.dart';

abstract class FavoritesDatasource {
  
  Future<void> addFavorite(String userId,MealCreationReq meal);
  Future<List<MealCreationReq>> getFavorites(String userId,);
  Future<void> removeFavorite(String userId,MealCreationReq meal);
}

class FavoritesDatasourceImp extends FavoritesDatasource {
  final FirebaseFirestore firestore;
  FavoritesDatasourceImp({required this.firestore});
  
  @override
  Future<void> addFavorite(String userId, MealCreationReq meal)async {
    final userCollection= firestore.collection('users');
    final userDoc= userCollection.doc(userId);
    final favoriteCollection= userDoc.collection('favorites');
    final favoriteDoc= favoriteCollection.doc();
    String id= favoriteDoc.id;
    meal.id=id;
    await favoriteDoc.set(meal.toDocument());
  }

  @override
  Future<List<MealCreationReq>> getFavorites(String userId)async {
    final userCollection= firestore.collection('users');
    final userDoc= userCollection.doc(userId);
    final favoriteCollection= userDoc.collection('favorites');
    return await favoriteCollection.get().then((value) => value.docs.map((e) => MealCreationReq.fromSnaoshot(e)).toList());
  }

  @override
  Future<void> removeFavorite(String userId, MealCreationReq meal)async {
    final userCollection= firestore.collection('users');
    final userDoc= userCollection.doc(userId);
    final favoriteCollection= userDoc.collection('favorites');
    final favoriteDoc= favoriteCollection.doc(meal.id);
    await favoriteDoc.delete();
  }

}