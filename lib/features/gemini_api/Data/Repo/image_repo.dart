import '../models/ImageModel.dart';

abstract class ImageRepository {
  Future<ImageModel> getImage(String dishName);
}
