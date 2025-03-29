import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/ImageModel.dart';

abstract class ImageDataSource {
  Future<ImageModel> getImage(String dishName);
}

class ImageDataSourceImpl implements ImageDataSource {
  final String apiKey = 'aecfa90119c244b986c2ba961d29b473';

  ImageDataSourceImpl();

  @override
  Future<ImageModel> getImage(String dishName) async {
    final url = Uri.parse(
        'https://api.spoonacular.com/recipes/complexSearch?query=$dishName&addRecipeInformation=true&apiKey=$apiKey'
    );

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print('get api success');
      if (data['results'] != null && data['results'].isNotEmpty) {
        print(data['results'][0]['image']);
        print('image get success');
        return ImageModel(imageUrl: data['results'][0]['image']);
      } else {
        print('image get fail');
        return ImageModel(imageUrl: 'https://th.bing.com/th/id/OIP.NCGnoM-SKlkSgWdrPFC2_wHaFj?w=2000&h=1500&rs=1&pid=ImgDetMain');
      }
    } else {
      throw Exception('Failed to load recipe image');
    }
  }
}