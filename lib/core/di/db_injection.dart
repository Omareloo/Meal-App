import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:meal_ware/features/auth/domain/use_case/log_in_use_case.dart';
import 'package:meal_ware/features/auth/domain/use_case/sign_up_use_case.dart';
import 'package:meal_ware/features/auth/presentation/manager/cubits/log_in_cubit.dart';
import 'package:meal_ware/features/auth/presentation/manager/cubits/register_cubit.dart';
import '../../features/auth/data/data_source/auth_datasource.dart';
import '../data/local/shared_preferences_service.dart';
import '../../features/auth/data/repositories/auth_repo_impl.dart';
import '../../features/auth/domain/repositories/auth_repo.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // ✅ Firebase Services
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

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


}
