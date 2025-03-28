
import 'package:meal_ware/features/home/domain/entity/meal_entity.dart';

abstract class HomeRepository {
  Future<List<MealModel>> getAllMeals();
}