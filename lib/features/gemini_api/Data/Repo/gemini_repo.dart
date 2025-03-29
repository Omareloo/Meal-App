
import '../models/gemini_model.dart';

abstract class MealRepository {
  Future<GeminiModel> getMealSuggestion(String ingredients);
}