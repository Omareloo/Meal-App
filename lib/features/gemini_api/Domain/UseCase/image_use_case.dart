import '../../Data/Repo/image_repo.dart';
import '../../Data/models/ImageModel.dart';

class ImageUseCase {
  final ImageRepository repository;

  ImageUseCase({required this.repository});

  Future<ImageModel> execute(String dishName) async {
    return await repository.getImage(dishName);
  }
}