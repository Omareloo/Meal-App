import '../../Domain/entites/meal_entity.dart';
class AIMealModel extends AIMeal {
  const AIMealModel({
    required super.name,
    required super.mealType,
    required super.rating,
    required super.cookTime,
    required super.servingSize,
    required super.summary,
    required super.ingredients,
    required super.mealSteps,
  });

  factory AIMealModel.fromJson(Map<String, dynamic> json) {
    return AIMealModel(
      name: json['name'],
      mealType: json['meal_type'],
      rating: json['rating'],
      cookTime: json['cook_time'],
      servingSize: json['serving_size'],
      summary: json['summary'],
      ingredients: List<IngredientModel>.from(
          json['ingredients'].map((x) => IngredientModel.fromJson(x))),
      mealSteps: List<String>.from(json['meal_steps'].map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'meal_type': mealType,
    'rating': rating,
    'cook_time': cookTime,
    'serving_size': servingSize,
    'summary': summary,
    'ingredients': List<dynamic>.from(ingredients.map((x) => x.toJson())),
    'meal_steps': List<dynamic>.from(mealSteps.map((x) => x)),
  };
}

class IngredientModel {
  IngredientModel({
    required this.name,
    required this.imageUrl,
    required this.quantity,
  });

  String name;
  String imageUrl;
  String quantity;

  factory IngredientModel.fromJson(Map<String, dynamic> json) =>
      IngredientModel(
        name: json["name"],
        imageUrl: json["image_url"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image_url": imageUrl,
    "quantity": quantity,
  };
}