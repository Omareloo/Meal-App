import '../../Data/Repo/gemini_repo.dart';
import '../../Data/models/gemini_model.dart';

class MealUseCase {
  final MealRepository mealRepository;
  MealUseCase({required this.mealRepository});

  Future<GeminiModel> call(String ingredients) async {
    return await mealRepository.getMealSuggestion(ingredients);
  }
}