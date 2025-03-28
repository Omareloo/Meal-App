import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meal_ware/features/auth/data/data_source/auth_datasource.dart';
import 'package:meal_ware/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:meal_ware/features/auth/domain/repositories/auth_repo.dart';
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

import '../data/local/Profile/ProfileService.dart';
import '../data/local/shared_preferences_service.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // ✅ Initialize Firebase & Hive
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  await Hive.initFlutter();
  getIt.registerSingleton<ProfileService>(ProfileService());
  getIt.registerSingleton<SharedPreferencesHelper>(SharedPreferencesHelper());

  // ✅ Connectivity Service
  getIt.registerLazySingleton<Connectivity>(() => Connectivity());

  // ✅ Auth Dependencies
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
  getIt.registerLazySingleton<FavoritesDatasource>(
        () => FavoritesDatasourceImp(firestore: getIt<FirebaseFirestore>()),
  );

  // ✅ Favorites Repository
  getIt.registerLazySingleton<FavoritesRepository>(
        () => FavoritesRepositoryImp(favoritesDatasource: getIt<FavoritesDatasource>()),
  );

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
