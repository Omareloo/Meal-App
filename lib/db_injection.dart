import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/data/local/shared_preferences_service.dart';
import 'features/auth/data/repositories/auth_repository.dart';
import 'features/auth/domain/repositories/auth_repo.dart';


final sl = GetIt.instance;

class DpInjection {
  static  init() async{

    ///Shared Preferences
    await _initSharedPref();

    ///Repositories
    _authRepoInit();
  }

  static Future<void> _initSharedPref() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerSingleton<SharedPreferencesService>(
      SharedPreferencesService (sharedPreferences: sharedPreferences),
    );
  }
  static _authRepoInit() {
    sl.registerLazySingleton<AuthRepository>(() => ImplAuthRepo());
  }

  static close() {
    sl.reset();
  }

}
