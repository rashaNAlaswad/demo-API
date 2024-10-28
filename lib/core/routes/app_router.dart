import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/signin/screens/sign_in_screen.dart';
import '../../features/auth/signin/signin_cubit/signin_cubit.dart';
import '../../features/auth/signup/screens/sign_up_screen.dart';
import '../../features/auth/signup/signup_cubit/signup_cubit.dart';
import '../../features/profile/screens/profile_screen.dart';
import '../../features/profile/screens/update_profile_screen.dart';
import '../../features/profile/user_cubit/user_cubit.dart';
import '../../features/splash/splash_screen.dart';
import '../services/service_locator.dart';
import 'routes.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.intitlRoute:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case Routes.signIn:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => sl<SigninCubit>(),
                  child: const SignInScreen(),
                ));
      case Routes.signUp:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => sl<SignupCubit>(),
                  child: const SignUpScreen(),
                ));
      case Routes.profile:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => sl<UserCubit>()..getUserData(),
                  child: const ProfileScreen(),
                ));
      case Routes.updateProfile:
        MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: BlocProvider.of<UserCubit>(context),
            child: const UpdateProfileScreen(),
          ),
        );
    }
    return MaterialPageRoute(
        builder: (context) => const Scaffold(
              body: Center(child: Text('Page not found')),
            ));
  }
}
