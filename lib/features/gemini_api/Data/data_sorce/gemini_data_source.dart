import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import '../models/gemini_model.dart';


abstract class GeminiRemoteDatasource {
  Future<AIMealModel> getRecipeSuggestions(String ingredients);
}

class GeminiRemoteDatasourceImpl implements GeminiRemoteDatasource {
  final String apiKey = 'AIzaSyCjKwqoUqyjI0vxQUQysTUF3hPErisU1Do';


  GeminiRemoteDatasourceImpl();

  final gemini = GenerativeModel(
    model: 'gemini-1.5-flash-latest',
    apiKey: 'AIzaSyCjKwqoUqyjI0vxQUQysTUF3hPErisU1Do',
  );
  String extractJson(String responseText) {
    final jsonStart = responseText.indexOf('{');
    final jsonEnd = responseText.lastIndexOf('}');
    if (jsonStart == -1 || jsonEnd == -1) {
      throw Exception('JSON data not found in the response');
    }
    return responseText.substring(jsonStart, jsonEnd + 1);
  }
  @override
  Future<AIMealModel> getRecipeSuggestions(String ingredients) async {
    try {
      final prompt = '''
      I need a recipe suggestion for a meal in JSON format that matches the structure of the model I provided below. The JSON should include the following sections: 
      - `name` (recipe name),
      - `meal_type` (type of meal),
      - `rating` (rating of the recipe),
      - `cook_time` (time to cook in minutes),
      - `serving_size` (number of servings),
      - `summary` (includes a description and a list of nutritional information),
      - `ingredients` (list of ingredients with names,image_url,and quantity in pieces),
      - `meal_steps` (list of cooking instructions).

      Return the response strictly in JSON format without any additional text or comments.
      Ensure the JSON response strictly adheres to the JSON standard:
- All keys and string values must be enclosed in double quotes.
- Fractions or mixed strings like `1/2` must be quoted as `"1/2"`.

      ingredients : $ingredients

      ''';

      final content = [Content.text(prompt)];

      final response = await gemini.generateContent(content);
      if (response.text == null) {
        throw Exception('JSON data not found in the response');
      }
      final jsonString = extractJson(response.text!.trim());
      final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
      printLongText(jsonString);
      return AIMealModel.fromJson(jsonMap);
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      throw Exception('Error fetching recipe suggestions: $e');
    }
  }
  void printLongText(String text) {
    final pattern = RegExp('.{1,800}');
    for (final match in pattern.allMatches(text)) {
      if (kDebugMode) {
        print(match.group(0));
      }
    }
  }
}
