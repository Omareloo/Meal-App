import '../../Data/models/gemini_model.dart';

class AIMeal {
  const AIMeal({
    required this.name,
    required this.mealType,
    required this.rating,
    required this.cookTime,
    required this.servingSize,
    required this.summary,
    required this.ingredients,
    required this.mealSteps,
  });
  final String name;
  final String mealType;
  final int rating;
  final int cookTime;
  final int servingSize;
  final String summary;
  final List<IngredientModel> ingredients;
  final List<String> mealSteps;
}

class Ingredient {
  Ingredient({
    required this.name,
    required this.imageUrl,
    required this.quantity,
  });

  String name;
  String imageUrl;
  String quantity;
}