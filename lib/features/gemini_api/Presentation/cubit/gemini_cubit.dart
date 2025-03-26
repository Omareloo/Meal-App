import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Domain/UseCase/gemini_use_case.dart';
import '../../Domain/UseCase/image_use_case.dart';
import 'gemini_states.dart';

class MealCubit extends Cubit<MealState> {
  final GetMealRecommendation getMealRecommendation;
  final GetDishImage getDishImage;

  static MealCubit get(BuildContext context) => context.read<MealCubit>();


  TextEditingController ingredientsController = TextEditingController();


  MealCubit(this.getMealRecommendation, this.getDishImage) : super(MealInitial());

  Future<void> getMealAndImage(String ingredients) async {
    emit(MealLoading());
    try {
      final aiMeal = await getMealRecommendation(ingredients);
      final image = await getDishImage(aiMeal.name);
      emit(MealLoaded(aiMeal: aiMeal, image: image));
    }
    catch (e) {
      emit(MealError(message: e.toString()));
    }
  }
}