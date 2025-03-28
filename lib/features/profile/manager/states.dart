import 'package:equatable/equatable.dart';
import 'package:meal_ware/core/data/local/Profile/ProfileModel.dart';

abstract class ProfileState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final ProfileModel profile;
  ProfileLoaded({required this.profile});

  @override
  List<Object?> get props => [profile];
}

class ProfileError extends ProfileState {
  final String message;
  ProfileError(this.message);

  @override
  List<Object?> get props => [message];
}
