import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meal_ware/features/home/data/models/meal_model.dart';

abstract class HomeDatasource {
  Future<List<MealCreationReq>> getAllMeals();
}

class HomeDatasourceImpl extends HomeDatasource {
  final FirebaseFirestore firestore;

  HomeDatasourceImpl({required this.firestore});

  @override
  Future<List<MealCreationReq>> getAllMeals() async {
    final mealCollection = firestore.collection('meals');
    final snapshot = await mealCollection.get();

    return snapshot.docs.map((doc) => MealCreationReq.fromSnapshot(doc)).toList();
  }
}
