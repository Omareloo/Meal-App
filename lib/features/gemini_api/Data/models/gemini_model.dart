class GeminiModel {
  final String id;
  final String recipeName;
  final String totalTime;
  final String summary;
  final NutritionModel nutrition;
  final int numberOfIngredients;
  final List<String> ingredients;
  final List<String> directions;

  GeminiModel({
    required this.id,
    required this.recipeName,
    required this.totalTime,
    required this.summary,
    required this.nutrition,
    required this.numberOfIngredients,
    required this.ingredients,
    required this.directions,
  });

  factory GeminiModel.fromJson(Map<String, dynamic> json) => GeminiModel(
    id: json["id"],
    recipeName: json["recipeName"],
    totalTime: json["totalTime"],
    summary: json["summary"],
    nutrition: NutritionModel.fromJson(json["nutrition"]),
    numberOfIngredients: json["numberOfIngredients"],
    ingredients: List<String>.from(json["ingredients"].map((x) => x)),
    directions: List<String>.from(json["directions"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "recipeName": recipeName,
    "totalTime": totalTime,
    "summary": summary,
    "nutrition": nutrition.toJson(),
    "numberOfIngredients": numberOfIngredients,
    "ingredients": List<dynamic>.from(ingredients.map((x) => x)),
    "directions": List<dynamic>.from(directions.map((x) => x)),
  };
}

class NutritionModel {
  final String calories;
  final String protein;
  final String fat;
  final String carbohydrates;

  NutritionModel({
    required this.calories,
    required this.protein,
    required this.fat,
    required this.carbohydrates,
  });

  factory NutritionModel.fromJson(Map<String, dynamic> json) => NutritionModel(
    calories: json["calories"],
    protein: json["protein"],
    fat: json["fat"],
    carbohydrates: json["carbohydrates"],
  );

  Map<String, dynamic> toJson() => {
    "calories": calories,
    "protein": protein,
    "fat": fat,
    "carbohydrates": carbohydrates,
  };
}