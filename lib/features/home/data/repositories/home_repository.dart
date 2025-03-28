import 'package:meal_ware/features/home/data/data_source/home_datasource.dart';
import 'package:meal_ware/features/home/domain/entity/meal_entity.dart';
import 'package:meal_ware/features/home/domain/repositories/home_repo.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeDatasource homeDatasource;

  HomeRepositoryImpl({required this.homeDatasource});

  @override
  Future<List<MealModel>> getAllMeals() async {
    try {
      return await homeDatasource.getAllMeals();
    } catch (e) {
      throw Exception('Failed to fetch meals: $e');
    }
  }
}
