import '../../Data/models/ImageModel.dart';
import '../../Data/models/gemini_model.dart';


abstract class MealState {}

class MealInitial extends MealState {}

class MealLoading extends MealState {}

class MealLoaded extends MealState {
  final GeminiModel? aiMeal;
  final ImageModel? dishImage;

   MealLoaded({this.aiMeal, this.dishImage,});
}

class MealError extends MealState {
  final String message;
  MealError({required this.message});
}