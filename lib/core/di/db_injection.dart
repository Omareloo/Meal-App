import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meal_ware/features/auth/data/data_source/auth_datasource.dart';
import 'package:meal_ware/features/auth/data/repositories/auth_repo_impl.dart';

import 'package:meal_ware/features/auth/domain/repositories/auth_repo.dart';

import 'package:meal_ware/features/gemini_api/Data/Repo/gemini_repo.dart';
import 'package:meal_ware/features/gemini_api/Data/data_sorce/gemini_data_source.dart';
import 'package:meal_ware/features/gemini_api/Domain/repo/gemini_repo.dart';
import 'package:meal_ware/features/gemini_api/Presentation/cubit/gemini_cubit.dart';
import 'package:meal_ware/features/home/data/data_source/favorites_datasource.dart';

import 'package:meal_ware/features/auth/domain/use_case/log_in_use_case.dart';
import 'package:meal_ware/features/auth/domain/use_case/sign_up_use_case.dart';
import 'package:meal_ware/features/auth/presentation/manager/cubits/log_in_cubit.dart';
import 'package:meal_ware/features/auth/presentation/manager/cubits/register_cubit.dart';

import 'package:meal_ware/features/fav/managers/cubit.dart';
import 'package:meal_ware/features/home/data/data_source/favorites_datasource.dart';
import 'package:meal_ware/features/home/data/data_source/home_datasource.dart';
import 'package:meal_ware/features/home/data/repositories/favorite_repository.dart';
import 'package:meal_ware/features/home/data/repositories/home_repository.dart';
import 'package:meal_ware/features/home/domain/repositories/favorite_repo.dart';
import 'package:meal_ware/features/home/domain/repositories/home_repo.dart';
import 'package:meal_ware/features/home/domain/use_case/add_favorite_use_case.dart';
import 'package:meal_ware/features/home/domain/use_case/get_favorite_use_case.dart';
import 'package:meal_ware/features/home/domain/use_case/get_meal_use_case.dart';
import 'package:meal_ware/features/home/domain/use_case/remove_favorite_use_case.dart';
import 'package:meal_ware/features/home/presentation/manager/cubit.dart';
import 'package:meal_ware/features/profile/manager/cubit.dart';

// ✅ Favorite Dependencies


import '../../features/auth/data/data_source/auth_datasource.dart';
import '../../features/gemini_api/Data/Repo/image_repo.dart';
import '../../features/gemini_api/Data/data_sorce/image_data_source.dart';
import '../../features/gemini_api/Domain/UseCase/gemini_use_case.dart';
import '../../features/gemini_api/Domain/UseCase/image_use_case.dart';
import '../../features/gemini_api/Domain/repo/image_repo.dart';

import '../data/local/Profile/ProfileService.dart';
import '../data/local/shared_preferences_service.dart';

final getIt = GetIt.instance;
Future<void> setupServiceLocator() async {

  // ✅ Initialize Firebase & Hive

  //hive

  // ✅ Firebase Services

  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  await Hive.initFlutter();
  getIt.registerSingleton<ProfileService>(ProfileService());
  getIt.registerSingleton<SharedPreferencesHelper>(SharedPreferencesHelper());


  // ✅ Connectivity Service
  getIt.registerLazySingleton<Connectivity>(() => Connectivity());

  // ✅ Auth Dependencies

//Remote data source
  getIt.registerLazySingleton<DataSource>(
          ()=>AuthDataSourceImpl(auth: getIt.call(), firestore: getIt.call()));

  getIt.registerLazySingleton<FavoritesDatasource>(
          ()=>FavoritesDatasourceImp(firestore: getIt.call()));


  // ✅ Connectivity
  // getIt.registerLazySingleton<Connectivity>(() => Connectivity());

  getIt.registerLazySingleton<AuthDataSourceImpl>(
        () => AuthDataSourceImpl(auth: getIt<FirebaseAuth>(), firestore: getIt<FirebaseFirestore>()),
  );


  getIt.registerLazySingleton<AuthRepo>(
        () => AuthRepoImpl(getIt<AuthDataSourceImpl>(), getIt<Connectivity>()),
  );

  getIt.registerLazySingleton<LoginUseCase>(() => LoginUseCase(getIt<AuthRepo>()));
  getIt.registerLazySingleton<SignUpUseCase>(() => SignUpUseCase(getIt<AuthRepo>()));

  getIt.registerFactory<LogInCubit>(() => LogInCubit(getIt<LoginUseCase>()));
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt<SignUpUseCase>()));

  // ✅ Home Feature Dependencies
  getIt.registerLazySingleton<HomeDatasource>(
        () => HomeDatasourceImpl(firestore: getIt<FirebaseFirestore>()),
  );

  getIt.registerLazySingleton<HomeRepository>(
        () => HomeRepositoryImpl(homeDatasource: getIt<HomeDatasource>()),
  );

  getIt.registerLazySingleton<GetMealsUseCase>(
        () => GetMealsUseCase(repository: getIt<HomeRepository>()),
  );

  getIt.registerFactory<HomeBloc>(
        () => HomeBloc(getMealsUseCase: getIt<GetMealsUseCase>()),
  );

  getIt.registerFactory<ProfileCubit>(() => ProfileCubit());

  // ✅ Favorite Feature Dependencies
  // ✅ Favorites Data Source
  // getIt.registerLazySingleton<FavoritesDatasource>(
  //       () => FavoritesDatasourceImp(firestore: getIt<FirebaseFirestore>()),
  // );

  // ✅ Favorites Repository
  getIt.registerLazySingleton<FavoritesRepository>(
        () => FavoritesRepositoryImp(favoritesDatasource: getIt<FavoritesDatasource>()),
  );

 
 



  



  // Gemini Integration
  getIt.registerLazySingleton<GeminiRemoteDatasource>( () => GeminiRemoteDatasourceImpl());
  getIt.registerLazySingleton<MealRepository>(() => MealRepositoryImpl(geminiRemoteDatasource: getIt<GeminiRemoteDatasource>()));
  getIt.registerLazySingleton<GetMealRecommendation>(() => GetMealRecommendation(mealRepository: getIt<MealRepository>()));


  getIt.registerFactory<MealCubit>(
        () => MealCubit(getIt<GetMealRecommendation>()  , getIt<GetDishImage>() ),
  );

  // Image Integration
  getIt.registerLazySingleton<ImageRemoteDatasource>( () => ImageRemoteDatasourceImpl());
  getIt.registerLazySingleton<ImageRepository>(() => ImageRepositoryImpl(imageRemoteDatasource: getIt<ImageRemoteDatasource>()));
  getIt.registerLazySingleton<GetDishImage>(() => GetDishImage(imageRepository: getIt<ImageRepository>()));




  // ✅ Register Favorite Use Cases Separately
  getIt.registerLazySingleton<AddFavoriteUseCase>(
        () => AddFavoriteUseCase(favoritesRepository: getIt<FavoritesRepository>()),
  );


  getIt.registerLazySingleton<GetFavoritesUseCase>(
        () => GetFavoritesUseCase(favoritesRepository: getIt<FavoritesRepository>()),
  );

  getIt.registerLazySingleton<RemoveFavoriteUseCase>(
        () => RemoveFavoriteUseCase(favoritesRepository: getIt<FavoritesRepository>()),
  );

  // ✅ Register FavoriteCubit with all use cases
  getIt.registerFactory<FavoriteCubit>(
        () => FavoriteCubit(
      addFavoriteUseCase: getIt<AddFavoriteUseCase>(),
      getFavoritesUseCase: getIt<GetFavoritesUseCase>(),
      removeFavoriteUseCase: getIt<RemoveFavoriteUseCase>(),
    ),
  );
}
