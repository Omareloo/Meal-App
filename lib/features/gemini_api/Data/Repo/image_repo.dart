import 'package:meal_ware/features/gemini_api/Domain/entites/image_entity.dart';


abstract class ImageRepository {
  Future<ImageEntity> getDishImage(String dishName);
}