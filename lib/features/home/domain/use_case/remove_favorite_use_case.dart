import 'package:meal_ware/features/home/domain/repositories/favorite_repo.dart';
import 'package:either_dart/either.dart';

class RemoveFavoriteUseCase {
  final FavoritesRepository favoritesRepository;

  RemoveFavoriteUseCase({required this.favoritesRepository});

  Future<Either<String, void>> call(String userId, String mealId) async {
    return await favoritesRepository.removeFavorite(userId, mealId);
  }
}
