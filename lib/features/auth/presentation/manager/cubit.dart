import 'package:bloc/bloc.dart';
import 'package:meal_ware/features/auth/presentation/manager/states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitial());

}