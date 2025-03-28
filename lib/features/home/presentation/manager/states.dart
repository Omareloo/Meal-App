
import 'package:meal_ware/features/home/domain/entity/meal_entity.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<MealModel> meals;
  HomeLoaded({required this.meals});
}

class HomeError extends HomeState {
  final String message;
  HomeError({required this.message});
}
