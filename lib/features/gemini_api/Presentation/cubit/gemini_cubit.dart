import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_ware/features/gemini_api/Domain/UseCase/gemini_use_case.dart';
import '../../Data/models/ImageModel.dart';
import '../../Data/models/gemini_model.dart';
import '../../Domain/UseCase/image_use_case.dart';
import 'gemini_states.dart';

class MealCubit extends Cubit<MealState> {
  final MealUseCase getMealRecommendation;
  final ImageUseCase getDishImage;

  static MealCubit get(BuildContext context) => context.read<MealCubit>();

  TextEditingController ingredientsController = TextEditingController();

  MealCubit(
      this.getMealRecommendation, this.getDishImage)
      : super(MealInitial()) {
    if (kDebugMode) {
      print('Initialized');
    }
  }

  GeminiModel? aiMeal;
  ImageModel? dishImage;

  Future<void> getMealAndImage(String ingredients) async {
    emit(MealLoading());
    try {
      aiMeal = (await getMealRecommendation(ingredients));
      if (kDebugMode) {
        print(aiMeal!.recipeName);
      }
      if (kDebugMode) {
        print('Initialized Meal');
      }
      dishImage = (await getDishImage.execute(aiMeal!.recipeName));
      if (kDebugMode) {
        print('Initialized Dish Image');
      }
      emit(MealLoaded(aiMeal: aiMeal, dishImage: dishImage));
        } catch (e) {
      emit(MealError(message: e.toString()));
    }
  }
}