import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_ware/features/home/domain/entity/meal_entity.dart';
import 'package:meal_ware/features/home/domain/use_case/get_meal_use_case.dart';
import 'package:meal_ware/features/home/presentation/manager/states.dart';


class HomeBloc extends Cubit<HomeState> {
  final GetMealsUseCase getMealsUseCase;

  HomeBloc({required this.getMealsUseCase}) : super(HomeInitial());

  Future<void> fetchMeals() async {
    emit(HomeLoading());
    try {
      final meals = await getMealsUseCase.execute(); // Use execute() to fetch meals
      emit(HomeLoaded(meals: meals));
    } catch (e) {
      emit(HomeError(message: e.toString()));
    }
  }
}
