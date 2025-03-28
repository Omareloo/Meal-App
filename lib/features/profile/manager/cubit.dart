import 'package:bloc/bloc.dart';
import 'package:meal_ware/core/data/local/Profile/ProfileModel.dart';
import 'package:meal_ware/core/data/local/Profile/ProfileService.dart';
import 'package:meal_ware/core/di/db_injection.dart';
import 'package:meal_ware/features/profile/manager/states.dart';


class ProfileCubit extends Cubit<ProfileState> {
  final ProfileService profileService = getIt<ProfileService>();

  ProfileCubit() : super(ProfileInitial());

  /// Fetch profile data
  Future<void> loadProfile() async {
    emit(ProfileLoading());

    try {
      ProfileModel? profile = await profileService.getProfile();
      if (profile != null) {
        emit(ProfileLoaded(profile: profile));
      } else {
        emit(ProfileError("Profile data not found"));
      }
    } catch (e) {
      emit(ProfileError("Failed to load profile: $e"));
    }
  }
}
