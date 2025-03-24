import 'package:bloc/bloc.dart';
import '../../Domain/UseCase/gemini_use_case.dart';
import '../../Domain/UseCase/image_use_case.dart';
import 'gemini_states.dart';

class MealCubit extends Cubit<MealState> {
  final GetMealRecommendation getMealRecommendation;
  final GetDishImage getDishImage;

  MealCubit({
    required this.getMealRecommendation,
    required this.getDishImage,
  }) : super(MealInitial());

  Future<void> getMealAndImage(String ingredients, String dishName) async {
    emit(MealLoading());
    try {
      final aiMeal = await getMealRecommendation(ingredients);
      final image = await getDishImage(dishName);
      emit(MealLoaded(aiMeal: aiMeal, image: image));
    } catch (e) {
      emit(MealError(message: e.toString()));
    }
  }
}