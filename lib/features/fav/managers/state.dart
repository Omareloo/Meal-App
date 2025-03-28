import 'package:equatable/equatable.dart';
import 'package:meal_ware/features/home/data/models/meal_model.dart';
import 'package:meal_ware/features/home/domain/entity/meal_entity.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object?> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  final List<MealModel> favorites;

  const FavoriteLoaded(this.favorites);

  @override
  List<Object?> get props => [favorites];
}

class FavoriteError extends FavoriteState {
  final String message;

  const FavoriteError(this.message);

  @override
  List<Object?> get props => [message];
}
