import 'package:hive/hive.dart';
import 'ProfileModel.dart';

class ProfileService {
  static const String _boxProfile = 'profileBox';

  Future<Box<ProfileModel>> _openProfileBox() async {
    return Hive.openBox<ProfileModel>(_boxProfile);
  }

  Future<void> saveProfile(ProfileModel profile) async {
    var box = await _openProfileBox();
    await box.put('profileKey', profile);
  }

  Future<ProfileModel?> getProfile() async {
    var box = await _openProfileBox();
    return box.get('profileKey');
  }

  Future<void> updateProfile(ProfileModel updatedProfile) async {
    var box = await _openProfileBox();
    await box.put('profileKey', updatedProfile);
  }

  Future<void> deleteProfile() async {
    var box = await _openProfileBox();
    await box.delete('profileKey');
  }
}
