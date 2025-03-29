import 'dart:convert';
import 'package:google_generative_ai/google_generative_ai.dart';
import '../models/gemini_model.dart';


abstract class GeminiRemoteDatasource {
  Future<GeminiModel> geminiResponse({required String recipeName});
}

class GeminiRemoteDatasourceImpl implements GeminiRemoteDatasource {
  final String apiKey = 'AIzaSyCjKwqoUqyjI0vxQUQysTUF3hPErisU1Do';


  GeminiRemoteDatasourceImpl();

   @override
  Future<GeminiModel> geminiResponse({required String recipeName})async{
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

    final geminiModel = GeminiModel.fromJson(jsonResponse);

    return geminiModel;
   }
}
