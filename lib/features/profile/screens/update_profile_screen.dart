import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/functions.dart';
import '../../../core/routes/extensions.dart';
import '../../../core/utils/app_assets.dart';
import '../../widgets/common_form_field.dart';
import '../../widgets/custom_button.dart';
import '../user_cubit/user_cubit.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userCubit = BlocProvider.of<UserCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocConsumer<UserCubit, UserState>(
            listener: (context, state) {
              if (state is UpdateUserSuccessd) {
                context.pop();
              } else if (state is UpdateUserFailure) {
                showSnackBar(
                    context: context,
                    message: state.errorMessage,
                    state: SnakeState.error);
              }
              if (state is ImageFailure) {
                showSnackBar(
                    context: context,
                    message: state.message,
                    state: SnakeState.error);
              }
            },
            builder: (context, state) {
              return Column(
                children: [
                  SizedBox(height: 30.h),
                  Form(
                    key: context.read<UserCubit>().formKey,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(100),
                            onTap: () => context.read<UserCubit>().pickImage(),
                            child: buildProfileImage(state, context),
                          ),
                        ),
                        SizedBox(height: 30.h),
                        buildNameFormField(
                            controller: userCubit.nameController),
                        SizedBox(height: 30.h),
                        buildPhoneNumberFormField(
                            controller: userCubit.phoneController),
                        SizedBox(height: 60.h),
                        state is UpdateUserLoading
                            ? const CircularProgressIndicator()
                            : buildUpdateButton(context, userCubit),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  ClipOval buildProfileImage(UserState state, BuildContext context) {
    return ClipOval(
      child: (state is ImagePicked || state is UpdateUserLoading)
          ? Image.file(
              File((state is ImagePicked)
                  ? state.image.path
                  : context.read<UserCubit>().pickedImage!.path),
              height: 200.h,
              width: 200.w,
              fit: BoxFit.cover,
            )
          : Image.asset(
              AppAssets.avatar,
              height: 200.h,
              width: 200.w,
              fit: BoxFit.cover,
            ),
    );
  }
  
  Widget buildUpdateButton(BuildContext context, UserCubit userCubit) {
    return CustomButton(
      label: 'Update',
      onPressed: () {
        if (context.read<UserCubit>().formKey.currentState!.validate()) {
          userCubit.editProfile();
        }
      },
    );
  }
}
