import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routes/extensions.dart';
import '../../../../core/helpers/functions.dart';
import '../../../widgets/common_form_field.dart';
import '../../../widgets/custom_button.dart';
import '../signup_cubit/signup_cubit.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: BlocConsumer<SignupCubit, SignupState>(
              listener: (context, state) {
                if (state is SignupSuccess) {
                  context.pop();
                  showSnackBar(
                      context: context,
                      message: state.message,
                      state: SnakeState.success);
                } else if (state is SignupFailure) {
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
                    SizedBox(height: 16.h),
                    Form(
                      key: context.read<SignupCubit>().formKey,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: InkWell(
                                borderRadius: BorderRadius.circular(100),
                                onTap: () =>
                                    context.read<SignupCubit>().pickImage(),
                                child: profilePicture(state, context)),
                          ),
                          SizedBox(height: 20.h),
                          buildNameFormField(
                            controller:
                                context.read<SignupCubit>().nameController,
                          ),
                          SizedBox(height: 30.h),
                          buildEmailFormField(
                              controller:
                                  context.read<SignupCubit>().emaileController),
                          SizedBox(height: 30.h),
                          buildPhoneNumberFormField(
                              controller:
                                  context.read<SignupCubit>().phoneController),
                          SizedBox(height: 30.h),
                          buildPasswordFormField(
                              controller: context
                                  .read<SignupCubit>()
                                  .passwordController),
                          SizedBox(height: 30.h),
                          buildConfirmPasswordFormField(
                              controller: context
                                  .read<SignupCubit>()
                                  .confirmPasswordController),
                          SizedBox(height: 30.h),
                          state is SignupLoading
                              ? const CircularProgressIndicator()
                              : signUpButton(context),
                          alreadyHaveAnAccount(context)
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  ClipOval profilePicture(SignupState state, BuildContext context) {
    return ClipOval(
      child: (state is ImagePicked || state is SignupLoading)
          ? Image.file(
              File((state is ImagePicked)
                  ? state.image.path
                  : context.read<SignupCubit>().pickedImage!.path),
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

  Widget alreadyHaveAnAccount(BuildContext context) {
    return TextButton(
      onPressed: () => context.pop(),
      child: const Text(
        'Already have an account',
      ),
    );
  }

  Widget signUpButton(BuildContext context) {
    return CustomButton(
      label: 'Sign Up',
      onPressed: () {
        final cubit = context.read<SignupCubit>();
        if (cubit.formKey.currentState!.validate()) {
          cubit.signup();
        }
      },
    );
  }
}
