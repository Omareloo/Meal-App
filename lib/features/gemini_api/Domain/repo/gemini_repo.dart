import '../../Data/Repo/gemini_repo.dart';
import '../../Data/data_sorce/gemini_data_source.dart';
import '../../Data/models/gemini_model.dart';
import '../entites/meal_entity.dart';

class MealRepositoryImpl implements MealRepository {
  final GeminiRemoteDatasource geminiRemoteDatasource;

  MealRepositoryImpl({required this.geminiRemoteDatasource});
  @override
  Future<AIMeal> getMealSuggestion(String ingredients) async {
    final AIMealModel mealModel =
    await geminiRemoteDatasource.getRecipeSuggestions(ingredients);
    return mealModel;
  }
}