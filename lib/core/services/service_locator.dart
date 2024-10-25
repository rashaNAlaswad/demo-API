import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../database/cache/cache_helper.dart';
import '../../features/auth/signin/signin_cubit/signin_cubit.dart';
import '../../features/auth/signup/signup_cubit/signup_cubit.dart';
import '../../features/profile/user_cubit/user_cubit.dart';
import '../../features/repository/user_repository.dart';
import '../database/api/api_consumer.dart';
import '../database/api/dio_consumer.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerLazySingleton(() => SigninCubit(sl()));
  sl.registerLazySingleton(() => SignupCubit(sl()));
  sl.registerLazySingleton(() => UserCubit(sl()));

  sl.registerLazySingleton(() => UserRepository());

  sl.registerLazySingleton(() => CacheHelper());
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(sl()));
  sl.registerLazySingleton(() => Dio());
}
