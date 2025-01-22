import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shopping_app/core/style/color_app.dart';
import 'package:shopping_app/core/style/size_app.dart';
import 'package:shopping_app/core/style/string_app.dart';
import 'package:shopping_app/core/style/text_style.dart';
import 'package:shopping_app/feature/profile/cubit/profile_cubit.dart';
import 'package:shopping_app/feature/profile/cubit/profile_state.dart';
import 'package:shopping_app/feature/profile/view/widget/custom_profile_list_tile.dart';

class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width / 1.4,
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileSuccessState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: ColorApp.kButtonColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: SizeApp.s3.h,
                    children: [
                      CircleAvatar(
                        radius: SizeApp.s36.r,
                        backgroundImage: NetworkImage(
                            state.profileUserModel.profileModel.profileImage),
                      ),
                      Text(
                        state.profileUserModel.profileModel.name,
                        style: whiteBold16(),
                      ),
                      Text(state.profileUserModel.profileModel.email,
                          style: whiteBold12()),
                    ],
                  ),
                ),
                CustomProfileListTile(
                  icon: Icons.person,
                  title: StringApp.nationalId,
                  subTitle: state.profileUserModel.profileModel.nationalId,
                ),
                CustomProfileListTile(
                  icon: Icons.phone,
                  title: StringApp.phone,
                  subTitle: state.profileUserModel.profileModel.phone,
                ),
                CustomProfileListTile(
                  icon: Icons.male,
                  title: StringApp.gender,
                  subTitle: state.profileUserModel.profileModel.gender,
                ),
              ],
            );
          }
          return SpinKitFadingCircle(
            color: Colors.grey,
          );
        },
      ),
    );
  }
}
