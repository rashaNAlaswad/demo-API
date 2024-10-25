import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/routes/extensions.dart';
import '../../../core/helpers/functions.dart';
import '../../../core/routes/routes.dart';
import '../../widgets/custom_button.dart';
import '../user_cubit/user_cubit.dart';
import 'update_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is GetUserFailure) {
          showSnackBar(
              context: context,
              message: state.errorMessage,
              state: SnakeState.error);
        }
        if (state is DeleteUserFailure) {
          showSnackBar(
              context: context,
              message: state.errorMessage,
              state: SnakeState.error);
        }
      },
      builder: (context, state) {
        final userCubit = BlocProvider.of<UserCubit>(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Profile'),
          ),
          body: state is GetUserLoading
              ? buildLoadingIndicator()
              : state is GetUserSuccess
                  ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          SizedBox(height: 30.h),
                          buildProfileImage(state),
                          SizedBox(height: 30.h),
                          ListTile(
                            leading: const Icon(Icons.person),
                            title: Text(state.user.name),
                          ),
                          ListTile(
                            leading: const Icon(Icons.mail),
                            title: Text(state.user.email),
                          ),
                          ListTile(
                            leading: const Icon(Icons.phone),
                            title: Text(state.user.phone),
                          ),
                          SizedBox(height: 30.h),
                          buildEditProfileButton(context, userCubit),
                          SizedBox(height: 30.h),
                          deleteUserButton(context),
                        ],
                      ),
                    )
                  : const SizedBox(),
        );
      },
    );
  }

  Widget buildProfileImage(GetUserSuccess state) {
    return ClipOval(
      child: CachedNetworkImage(
        height: 200.h,
        width: 200.h,
        fit: BoxFit.cover,
        imageUrl: state.user.profilePic,
        errorWidget: (_, __, ___) => const Icon(Icons.error),
        placeholder: (_, __) => const CircularProgressIndicator(),
        useOldImageOnUrlChange: true,
      ),
    );
  }

  Widget buildEditProfileButton(BuildContext context, UserCubit userCubit) {
    return CustomButton(
      label: 'Edit Profile',
      color: AppColors.green,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider.value(
              value: userCubit,
              child: const UpdateProfileScreen(),
            ),
          ),
        ).then((_) {
          if (context.mounted) {
            userCubit.resetControllers();
            userCubit.getUserData();
          }
        });
      },
    );
  }

  Widget deleteUserButton(BuildContext context) {
    return CustomButton(
      label: 'Delete User',
      onPressed: () async {
        await context.read<UserCubit>().deleteUser();
        context.pushNamedAndRemoveUntil(Routes.signIn,
            predicate: (Route<dynamic> route) => false);
      },
      color: AppColors.red,
    );
  }

  Widget buildLoadingIndicator() {
    return const SizedBox.expand(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
