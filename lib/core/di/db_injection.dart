import 'package:get_it/get_it.dart';
import 'package:meal_ware/features/home/data/data_source/favorites_datasource.dart';
import '../../features/auth/data/data_source/auth_datasource.dart';
import '../data/local/shared_preferences_service.dart';
import '../../features/auth/data/repositories/auth_repository.dart';
import '../../features/auth/domain/repositories/auth_repo.dart';


final sl = GetIt.instance;

Future <void> init()async{
//Remote data source
sl.registerLazySingleton<DataSource>(
        ()=>DataSourceImpl(auth: sl.call(), firestore: sl.call()));

 sl.registerLazySingleton<FavoritesDatasource>(
        ()=>FavoritesDatasourceImp(firestore: sl.call()));       
}