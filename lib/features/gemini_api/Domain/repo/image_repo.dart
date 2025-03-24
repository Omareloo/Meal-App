import 'dart:ui';

import 'package:meal_ware/features/gemini_api/Domain/entites/image_entity.dart';

import '../../Data/Repo/image_repo.dart';
import '../../Data/data_sorce/image_data_source.dart';
import '../../Data/models/ImageModel.dart';


class ImageRepositoryImpl implements ImageRepository {
  final ImageRemoteDatasource imageRemoteDatasource;

  ImageRepositoryImpl({required this.imageRemoteDatasource});
  @override
  Future<ImageEntity> getDishImage(String dishName) async {
    final ImageModel imageModel =
    await imageRemoteDatasource.getDishImage(dishName);
    final String? imageUrl = imageModel.results!.first.image;
    return ImageEntity(imageUrl: imageUrl??ImageEntity.defaultImage);  }
}