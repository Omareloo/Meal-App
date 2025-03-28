import 'package:meal_ware/features/gemini_api/Domain/entites/image_entity.dart';
import '../../Domain/entites/meal_entity.dart';


abstract class MealState {}

class MealInitial extends MealState {}

class MealLoading extends MealState {}

class MealLoaded extends MealState {
  final AIMeal aiMeal;
  final ImageEntity image;

  MealLoaded({required this.aiMeal, required this.image});
}

class MealError extends MealState {
  final String message;

  MealError({required this.message});
}