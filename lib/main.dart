import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meal_ware/config/style/app_theme.dart';
import 'package:meal_ware/core/data/local/Profile/ProfileModel.dart';
import 'package:meal_ware/core/data/local/shared_preferences_service.dart';
import 'package:meal_ware/core/di/db_injection.dart';
import 'package:meal_ware/core/screens/splash_screen.dart';
import 'package:meal_ware/features/auth/presentation/pages/auth_screen.dart';
import 'package:meal_ware/features/fav/managers/cubit.dart';
import 'package:meal_ware/features/home/domain/use_case/get_meal_use_case.dart';
import 'package:meal_ware/features/home/presentation/manager/cubit.dart';
import 'package:meal_ware/features/home/presentation/pages/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setupServiceLocator(); // ✅ Setup dependencies
  await Hive.initFlutter();
  Hive.registerAdapter(ProfileModelAdapter());
  await getIt<SharedPreferencesHelper>().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(getMealsUseCase: getIt<GetMealsUseCase>())..fetchMeals(),
        ),
        BlocProvider(
          create: (context) => getIt<FavoriteCubit>(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: appTheme,
          home:  AuthScreen(),
        ),
      ),
    );
  }
}
