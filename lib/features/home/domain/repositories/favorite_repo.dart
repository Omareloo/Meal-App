import 'package:either_dart/either.dart';
import 'package:meal_ware/features/home/data/models/meal_model.dart';
import 'package:meal_ware/features/home/domain/entity/meal_entity.dart';

abstract class FavoritesRepository {
  Future<Either<String, void>> addFavorite(String userId, MealModel meal);
  Future<Either<String, List<MealModel>>> getFavorites(String userId);
  Future<Either<String, void>> removeFavorite(String userId, String mealId); // ✅ Change meal to mealId
}
