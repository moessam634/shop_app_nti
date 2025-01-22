import 'package:bloc/bloc.dart';
import 'package:shopping_app/feature/profile/cubit/profile_state.dart';
import 'package:shopping_app/feature/profile/model/data/profile_data.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  ProfileData profileData = ProfileData();

  getProfileCubit() async {
    emit(ProfileLoadingState());
    var success = await profileData.profileUserData();
    emit(
      ProfileSuccessState(profileUserModel: success),
    );
  }
}
