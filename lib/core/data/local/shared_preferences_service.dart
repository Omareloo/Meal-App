// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../exceptions/exceptions.dart';
//
// class SharedPreferencesService {
//   final SharedPreferences _sharedPreferences;
//
//   SharedPreferencesService({required SharedPreferences sharedPreferences})
//       : _sharedPreferences = sharedPreferences;
//
//   dynamic getData({required String key}) {
//     return _sharedPreferences.get(key);
//   }
//
//   Future<void> saveData({required String key, required dynamic value}) async {
//     try {
//       if (value is String) {
//         await _sharedPreferences.setString(key, value);
//       } else if (value is int) {
//         await _sharedPreferences.setInt(key, value);
//       } else if (value is bool) {
//         await _sharedPreferences.setBool(key, value);
//       } else if (value is double) {
//         await _sharedPreferences.setDouble(key, value);
//       } else {
//         await _sharedPreferences.setString(key, value.toString());
//       }
//     } catch (e) {
//       throw AppException("Error in saving data");
//     }
//   }
//
//   Future<bool> removeData(String key) async {
//     try {
//       return await _sharedPreferences.remove(key);
//     } catch (e) {
//       throw AppException("Error in removing data");
//     }
//   }
//
//   Future<bool> clearData() async {
//     try {
//       return await _sharedPreferences.clear();
//     } catch (e) {
//       throw AppException("Error in clearing data");
//     }
//   }
//
//   String? get token => getData(key: 'token');
//   setToken(String? token) async {
//     await saveData(key: 'token', value: token as String);
//   }
//
//   removeToken() async {
//     await removeData('token');
//   }
//
//
// }

import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';


class SharedPreferencesHelper {
  late SharedPreferences sharedPreferences;
  
  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
  Future<bool> getIsFirstTime() async {
    bool firstTime = sharedPreferences.getBool("isFirstTime") ?? true;
    if (firstTime) {
      await sharedPreferences.setBool("isFirstTime", false);
    }
    return firstTime;
  }

   removeData(String key) async {
    await sharedPreferences.remove(key);
    log('Shared preferences helper: data with key $key has been removed');
  }

   clearAllData() async {
    await sharedPreferences.clear();
    log("All Data in shared preferences is removed");
  }

   setData(String key, value) async {
    switch (value.runtimeType) {
      case const (String):
        await sharedPreferences.setString(key, value);
        break;
      case const (int):
        await sharedPreferences.setInt(key, value);
        break;
      case const (bool):
        await sharedPreferences.setBool(key, value);
        break;
      case const (double):
        await sharedPreferences.setDouble(key, value);
        break;
      default:
        throw Exception("Invalid type");
    }
    log('Shared preferences helper: data with key $key has been set to $value');
  }

   Future<String> getString(String key) async {
    log('Shared preferences helper: fetched string with key $key: ${sharedPreferences.getString(key) ?? ""}');
    return sharedPreferences.getString(key) ?? "";
  }

   Future<int> getInt(String key) async {
    log('Shared preferences helper: fetched int with key $key: ${sharedPreferences.getInt(key) ?? 0}');
    return sharedPreferences.getInt(key) ?? 0;
  }

   Future<bool> getBool(String key) async {
    log('Shared preferences helper: fetched bool with key $key: ${sharedPreferences.getBool(key) ?? false}');
    return sharedPreferences.getBool(key) ?? false;
  }

   Future<double> getDouble(String key) async {
    log('Shared preferences helper: fetched double with key $key: ${sharedPreferences.getDouble(key) ?? 0}');
    return sharedPreferences.getDouble(key) ?? 0;
  }


}
