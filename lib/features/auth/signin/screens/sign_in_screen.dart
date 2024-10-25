import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routes/extensions.dart';
import '../../../../core/helpers/functions.dart';
import '../../../../core/routes/routes.dart';
import '../../../widgets/common_form_field.dart';
import '../../../widgets/custom_button.dart';
import '../signin_cubit/signin_cubit.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninFailure) {
          showSnackBar(
              context: context,
              message: state.errorMessage,
              state: SnakeState.error);
        } else if (state is SigninSuccess) {
          context.pushReplacementNamed(Routes.profile);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 100.h),
                    screenTitle(context),
                    SizedBox(height: 60.h),
                    Form(
                      key: BlocProvider.of<SigninCubit>(context).formKey,
                      child: Column(
                        children: [
                          buildEmailFormField(
                              controller:
                                  context.read<SigninCubit>().emaileController),
                          SizedBox(height: 30.h),
                          buildPasswordFormField(
                              controller: context
                                  .read<SigninCubit>()
                                  .passwordController),
                          SizedBox(height: 40.h),
                          state is SigninLoading
                              ? const CircularProgressIndicator()
                              : signInButton(context),
                          newAccountButton(context)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  TextButton newAccountButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.read<SigninCubit>().reset();
        context.pushNamed(Routes.signUp);
      },
      child: const Text(
        'Don\'t have an account? Sign Up',
      ),
    );
  }

  CustomButton signInButton(BuildContext context) {
    return CustomButton(
      label: 'Sign In',
      onPressed: () {
        if (BlocProvider.of<SigninCubit>(context)
            .formKey
            .currentState!
            .validate()) {
          BlocProvider.of<SigninCubit>(context).signIn();
        }
      },
    );
  }

  Widget screenTitle(BuildContext context) {
    return Text(
      'Sign In',
      style: Theme.of(context).textTheme.displayLarge,
    );
  }
}
