import 'package:shopping_app/feature/profile/model/model/profile_model.dart';

sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoadingState extends ProfileState {}

final class ProfileSuccessState extends ProfileState {
  final ProfileUserModel profileUserModel;

  ProfileSuccessState({required this.profileUserModel});
}

final class ProfileErrorState extends ProfileState {}
