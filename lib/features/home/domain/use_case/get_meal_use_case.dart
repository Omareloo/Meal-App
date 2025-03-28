import 'package:meal_ware/features/home/domain/entity/meal_entity.dart';
import 'package:meal_ware/features/home/domain/repositories/home_repo.dart';

class GetMealsUseCase {
  final HomeRepository repository;

  GetMealsUseCase({required this.repository});

  Future<List<MealModel>> execute() async {
    return await repository.getAllMeals();
  }
}
