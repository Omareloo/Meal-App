import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/ImageModel.dart';

abstract class ImageRemoteDatasource {
  Future<ImageModel> getDishImage(String dishName);
}

class ImageRemoteDatasourceImpl implements ImageRemoteDatasource {
  final String apiKey = 'aecfa90119c244b986c2ba961d29b473';
  @override
  Future<ImageModel> getDishImage(String dishName) async {
    String baseUrl = 'https://api.spoonacular.com/recipes/complexSearch';

    Uri url = Uri.https(baseUrl, '', {
      'apiKey': 'aecfa90119c244b986c2ba961d29b473',
      'query': dishName,
      'addRecipeInformation': 'false',
    });
    try {
      var response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );
      var json = jsonDecode(response.body);
      return ImageModel.fromJson(json);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}