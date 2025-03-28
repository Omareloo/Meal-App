import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meal_ware/config/style/app_color.dart';
import 'package:meal_ware/features/profile/manager/cubit.dart';
import 'package:meal_ware/features/profile/manager/states.dart';
import 'package:meal_ware/features/profile/presentation/widgets/editProfilePhoto.dart';
import 'package:meal_ware/features/profile/presentation/widgets/saveButton.dart';
import 'package:meal_ware/features/profile/presentation/widgets/textFormField.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance<ProfileCubit>()..loadProfile(),
      child: Scaffold(
        backgroundColor: AppColor.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is ProfileError) {
                return Center(child: Text(state.message));
              } else if (state is ProfileLoaded) {
                final profile = state.profile;
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Editprofilephoto(image: "https://letsenhance.io/static/73136da51c245e80edc6ccfe44888a99/1015f/MainBefore.jpg"),
                      SizedBox(height: 10),
                      Column(
                        children: [
                          MyTextformfield(initialValue: profile.username),
                          MyTextformfield(initialValue: profile.email),
                          MyTextformfield(initialValue: profile.phoneNumber),
                          Savebutton()
                        ],
                      ),
                    ],
                  ),
                );
              }
              return SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
