import '../../Data/Repo/image_repo.dart';
import '../../Data/data_sorce/image_data_source.dart';
import '../../Data/models/ImageModel.dart';


class ImageRepositoryImpl implements ImageRepository {
  final ImageDataSource imageDataSource;

  ImageRepositoryImpl({required this.imageDataSource});

  @override
  Future<ImageModel> getImage(String dishName) async {
    return await imageDataSource.getImage(dishName);
  }
}