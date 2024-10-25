import 'package:flutter/material.dart';

import 'app/app.dart';
import 'core/database/cache/cache_helper.dart';
import 'core/routes/app_router.dart';
import 'core/services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await sl<CacheHelper>().init();

  runApp(
    MainApp(
      appRouter: AppRouter(),
    ),
  );
}
