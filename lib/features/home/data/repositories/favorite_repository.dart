import 'package:meal_ware/features/home/data/data_source/favorites_datasource.dart';
import 'package:meal_ware/features/home/data/models/meal_model.dart';
import 'package:either_dart/either.dart';
import 'package:meal_ware/features/home/domain/entity/meal_entity.dart';
import 'package:meal_ware/features/home/domain/repositories/favorite_repo.dart';

class FavoritesRepositoryImp implements FavoritesRepository {
  final FavoritesDatasource favoritesDatasource;

  FavoritesRepositoryImp({required this.favoritesDatasource});

  @override
  Future<Either<String, void>> addFavorite(String userId, MealModel meal) async {
    try {
      await favoritesDatasource.addFavorite(userId, meal);
      return const Right(null);
    } catch (e) {
      return Left('Failed to add favorite: $e');
    }
  }

  @override
  Future<Either<String, List<MealModel>>> getFavorites(String userId) async {
    try {
      final favorites = await favoritesDatasource.getFavorites(userId);
      return Right(favorites);
    } catch (e) {
      return Left('Failed to fetch favorites: $e');
    }
  }

  @override
  Future<Either<String, void>> removeFavorite(String userId, String mealId) async {
    try {
      await favoritesDatasource.removeFavorite(userId, mealId);
      return const Right(null);
    } catch (e) {
      return Left('Failed to remove favorite: $e');
    }
  }
}
