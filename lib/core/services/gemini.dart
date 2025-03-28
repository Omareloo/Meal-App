import 'dart:convert';
import 'package:google_generative_ai/google_generative_ai.dart';

class Gemini{

  static Future<Map<String,dynamic>> geminiResponse({required String recipeName})async{
      final model = GenerativeModel(
        model: 'gemini-1.5-flash',
        apiKey: "AIzaSyBom3Hd-Ssxs6KMbxa-I6TE8H--eUQNR2g",
      );
      String prompt = '''
    Provide a response for the input $recipeName.  If $recipeName 
    does not correspond to a valid recipe, return: 'No information available'. 
    Otherwise, generate a detailed JSON output structured as follows: 
    {
      const "id":"gemini"
      "recipeName":"..."
      "totalTime ":"..."
      "summary": "...", 
      "nutrition": "...", 
      "numberOfIngredients": ...,
      "ingredients": [...], 
      "directions": "...",
    }. 
    Ensure the information is accurate, concise, and comprehensive.
    ''';

      final response = await model.generateContent([Content.text(prompt)]);

      final cleanedResponse = response.text?.replaceAll(RegExp(r'```json|```'), '') // Removes code markers
          .trim();

      final Map<String, dynamic> jsonResponse = jsonDecode(cleanedResponse!);

      print(jsonResponse);

      return jsonResponse;

  }


}