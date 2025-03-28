import 'package:bloc/bloc.dart';
import 'package:meal_ware/features/fav/managers/state.dart';
import 'package:meal_ware/features/home/data/models/meal_model.dart';
import 'package:meal_ware/features/home/domain/entity/meal_entity.dart';
import 'package:meal_ware/features/home/domain/use_case/add_favorite_use_case.dart';
import 'package:meal_ware/features/home/domain/use_case/get_favorite_use_case.dart';
import 'package:meal_ware/features/home/domain/use_case/remove_favorite_use_case.dart';



class FavoriteCubit extends Cubit<FavoriteState> {
  final AddFavoriteUseCase addFavoriteUseCase;
  final GetFavoritesUseCase getFavoritesUseCase;
  final RemoveFavoriteUseCase removeFavoriteUseCase;

  FavoriteCubit({
    required this.addFavoriteUseCase,
    required this.getFavoritesUseCase,
    required this.removeFavoriteUseCase,
  }) : super(FavoriteInitial());

  /// 🔹 Get all favorites
  Future<void> getFavorites(String userId) async {
    emit(FavoriteLoading());
    final result = await getFavoritesUseCase.call(userId);

    result.fold(
          (error) => emit(FavoriteError(error)), // Handle error case
          (favorites) => emit(FavoriteLoaded(favorites)), // Handle success case
    );
  }

  /// 🔹 Add favorite
  Future<void> addFavorite(String userId, MealModel meal) async {
    final result = await addFavoriteUseCase.call(userId, meal);

    result.fold(
          (error) => emit(FavoriteError(error)), // Handle error
          (_) => getFavorites(userId), // Refresh favorites on success
    );
  }

  /// 🔹 Remove favorite
  Future<void> removeFavorite(String userId, String mealId) async {
    final result = await removeFavoriteUseCase.call(userId, mealId);

    result.fold(
          (error) => emit(FavoriteError(error)), // Handle error
          (_) => getFavorites(userId), // Refresh favorites on success
    );
  }
}
