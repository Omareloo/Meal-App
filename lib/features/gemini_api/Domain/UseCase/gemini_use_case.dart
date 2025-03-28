import '../../Data/Repo/gemini_repo.dart';
import '../entites/meal_entity.dart';
import 'base_use_cse.dart';

class GetMealRecommendation implements UseCase<AIMeal, String> {
  final MealRepository mealRepository;
  GetMealRecommendation({required this.mealRepository});
  @override
  Future<AIMeal> call(String ingredients) async {
    return await mealRepository.getMealSuggestion(ingredients);
  }
}