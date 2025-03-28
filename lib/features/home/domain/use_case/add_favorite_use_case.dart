import 'package:meal_ware/features/home/data/models/meal_model.dart';
import 'package:meal_ware/features/home/domain/entity/meal_entity.dart';
import 'package:meal_ware/features/home/domain/repositories/favorite_repo.dart';
import 'package:either_dart/either.dart';

class AddFavoriteUseCase {
  final FavoritesRepository favoritesRepository;

  AddFavoriteUseCase({required this.favoritesRepository});

  Future<Either<String, void>> call(String userId, MealModel meal) async {
    return await favoritesRepository.addFavorite(userId, meal);
  }
}
