import 'package:bloc/bloc.dart';
import 'package:meal_ware/features/home/presentation/manager/states.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(AppInitial());

}