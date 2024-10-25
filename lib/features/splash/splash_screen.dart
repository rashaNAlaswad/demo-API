import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import '../../core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/database/cache/cache_helper.dart';
import '../../core/database/api/end_points.dart';
import '../../core/routes/extensions.dart';
import '../../core/routes/routes.dart';
import '../../core/services/service_locator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateToHome();
    super.initState();
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 2),
    ).then(
      (value) => checkIfTokenExists(),
    );
  }

  void checkIfTokenExists() {
    if (sl<CacheHelper>().getData(
          key: ApiKeys.token,
        ) ==
        null) {
      context.pushReplacementNamed(Routes.signIn);
    } else {
      context.pushReplacementNamed(Routes.profile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [buildSplashScreen()],
        ),
      ),
    );
  }

  DefaultTextStyle buildSplashScreen() {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.displayLarge!.copyWith(
        color: AppColors.white,
        fontSize: 30.sp,
        shadows: [
          const Shadow(
            blurRadius: 7.0,
            color: AppColors.white,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: AnimatedTextKit(
        repeatForever: true,
        animatedTexts: [
          FlickerAnimatedText('API DEMO APP'),
        ],
      ),
    );
  }
}
