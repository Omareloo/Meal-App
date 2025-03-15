import 'package:get_it/get_it.dart';
import '../../features/auth/data/data_source/auth_datasource.dart';
import '../data/local/Profile/ProfileService.dart';
import '../data/local/shared_preferences_service.dart';
import '../../features/auth/data/repositories/auth_repository.dart';
import '../../features/auth/domain/repositories/auth_repo.dart';


final sl = GetIt.instance;

Future <void> init()async{
  sl.registerSingleton<ProfileService>(ProfileService());
  sl.registerSingleton<SharedPreferencesHelper>(SharedPreferencesHelper());
//Remote data source
sl.registerLazySingleton<DataSource>(
        ()=>DataSourceImpl(auth: sl.call(), firestore: sl.call()));
}