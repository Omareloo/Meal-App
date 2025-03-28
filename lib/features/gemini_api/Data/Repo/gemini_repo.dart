import '../../Domain/entites/meal_entity.dart';
abstract class MealRepository {
  Future<AIMeal> getMealSuggestion(String ingredients);
}