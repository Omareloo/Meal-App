import '../../Data/Repo/gemini_repo.dart';
import '../../Data/data_sorce/gemini_data_source.dart';
import '../../Data/models/gemini_model.dart';

class MealRepositoryImpl implements MealRepository {
  final GeminiRemoteDatasource geminiRemoteDatasource;

  MealRepositoryImpl({required this.geminiRemoteDatasource});

  @override
  Future<GeminiModel> getMealSuggestion(String ingredients) {
    return geminiRemoteDatasource.geminiResponse(recipeName: ingredients);
  }
}