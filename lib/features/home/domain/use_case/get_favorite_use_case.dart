import 'package:meal_ware/features/home/data/models/meal_model.dart';
import 'package:meal_ware/features/home/domain/entity/meal_entity.dart';
import 'package:meal_ware/features/home/domain/repositories/favorite_repo.dart';
import 'package:either_dart/either.dart';

class GetFavoritesUseCase {
  final FavoritesRepository favoritesRepository;

  GetFavoritesUseCase({required this.favoritesRepository});

  Future<Either<String, List<MealModel>>> call(String userId) async {
    return await favoritesRepository.getFavorites(userId);
  }
}
