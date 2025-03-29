import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meal_ware/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:meal_ware/features/gemini_api/Data/Repo/gemini_repo.dart';
import 'package:meal_ware/features/gemini_api/Data/data_sorce/gemini_data_source.dart';
import 'package:meal_ware/features/gemini_api/Domain/repo/gemini_repo.dart';
import 'package:meal_ware/features/gemini_api/Presentation/cubit/gemini_cubit.dart';
import 'package:meal_ware/features/home/data/data_source/favorites_datasource.dart';
import 'package:meal_ware/features/auth/domain/use_case/log_in_use_case.dart';
import 'package:meal_ware/features/auth/domain/use_case/sign_up_use_case.dart';
import 'package:meal_ware/features/auth/presentation/manager/cubits/log_in_cubit.dart';
import 'package:meal_ware/features/auth/presentation/manager/cubits/register_cubit.dart';
import '../../features/auth/data/data_source/auth_datasource.dart';
import '../../features/gemini_api/Data/Repo/image_repo.dart';
import '../../features/gemini_api/Data/data_sorce/image_data_source.dart';
import '../../features/gemini_api/Domain/UseCase/gemini_use_case.dart';
import '../../features/gemini_api/Domain/UseCase/image_use_case.dart';
import '../../features/gemini_api/Domain/repo/image_repo.dart';
import '../data/local/Profile/ProfileService.dart';
import '../data/local/shared_preferences_service.dart';
import '../../features/auth/domain/repositories/auth_repo.dart';

final getIt = GetIt.instance;
Future<void> setupServiceLocator() async {
  //hive

  // ✅ Firebase Services
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  await Hive.initFlutter();
  getIt.registerSingleton<ProfileService>(ProfileService());
  getIt.registerSingleton<SharedPreferencesHelper>(SharedPreferencesHelper());
//Remote data source
  getIt.registerLazySingleton<DataSource>(
          ()=>AuthDataSourceImpl(auth: getIt.call(), firestore: getIt.call()));

  getIt.registerLazySingleton<FavoritesDatasource>(
          ()=>FavoritesDatasourceImp(firestore: getIt.call()));


  // ✅ Connectivity
  getIt.registerLazySingleton<Connectivity>(() => Connectivity());
  getIt.registerLazySingleton<AuthDataSourceImpl>(
        () => AuthDataSourceImpl(
      auth: getIt<FirebaseAuth>(),
      firestore: getIt<FirebaseFirestore>(),
    ),
  );
  getIt.registerLazySingleton<LoginUseCase>(
        () => LoginUseCase(getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton<AuthRepo>(
        () => AuthRepoImpl(getIt<AuthDataSourceImpl>(), getIt<Connectivity>()),
  );
  getIt.registerFactory<LogInCubit>(() => LogInCubit(getIt()));

  getIt.registerLazySingleton<SignUpUseCase>(
        () => SignUpUseCase(getIt<AuthRepo>()),
  );
  getIt.registerFactory<RegisterCubit>(
        () => RegisterCubit(getIt<SignUpUseCase>()),
  );

  // Gemini Integration
  getIt.registerLazySingleton<GeminiRemoteDatasource>( () => GeminiRemoteDatasourceImpl());
  getIt.registerLazySingleton<MealRepository>(() => MealRepositoryImpl(geminiRemoteDatasource: getIt<GeminiRemoteDatasource>()));
  getIt.registerLazySingleton<MealUseCase>(() => MealUseCase(mealRepository: getIt<MealRepository>()));

  getIt.registerFactory<MealCubit>(() => MealCubit(getIt<MealUseCase>(), getIt<ImageUseCase>()));

  // Image Integration
  getIt.registerLazySingleton<ImageDataSource>( () => ImageDataSourceImpl());
  getIt.registerLazySingleton<ImageRepository>(() => ImageRepositoryImpl(imageDataSource: getIt<ImageDataSource>()));
  getIt.registerLazySingleton<ImageUseCase>(() => ImageUseCase(repository: getIt<ImageRepository>()));

}

