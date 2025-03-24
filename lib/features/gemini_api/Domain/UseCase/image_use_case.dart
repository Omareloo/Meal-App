import 'package:meal_ware/features/gemini_api/Domain/entites/image_entity.dart';
import '../../Data/Repo/image_repo.dart';
import 'base_use_cse.dart';

class GetDishImage implements UseCase<ImageEntity, String> {
  final ImageRepository imageRepository;

  GetDishImage({required this.imageRepository});

  @override
  Future<ImageEntity> call(String dishName) async {
    return await imageRepository.getDishImage(dishName);
  }
}