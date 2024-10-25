import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../core/database/cache/cache_helper.dart';
import '../../core/database/api/api_consumer.dart';
import '../../core/database/api/end_points.dart';
import '../../core/helpers/functions.dart';
import '../../core/services/service_locator.dart';
import '../../errors/exceptions.dart';
import '../auth/signin/models/sign_in_model.dart';
import '../auth/signup/models/sign_up_model.dart';
import '../profile/models/edit_or_delete_user_model.dart';
import '../profile/models/user_model.dart';

class UserRepository {
  Future<Either<String, SignInModel>> signIn(
      {required String emaile, required String password}) async {
    try {
      final response =
          await sl<ApiConsumer>().post(EndPoints.signIn, bodayData: {
        ApiKeys.email: emaile,
        ApiKeys.password: password,
      });
      final signInModel = SignInModel.fromJson(response);
      final decodedToken = JwtDecoder.decode(signInModel.token);
      await sl<CacheHelper>()
          .saveData(key: ApiKeys.token, value: signInModel.token);
      await sl<CacheHelper>()
          .saveData(key: ApiKeys.id, value: decodedToken[ApiKeys.id]);
      return Right(signInModel);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  Future<Either<String, SignUpModel>> signUp(
      {required String name,
      required String phone,
      required String emaile,
      required String password,
      required String confirmPassword,
      required XFile image}) async {
    try {
      final response = await sl<ApiConsumer>().post(EndPoints.signUp,
          bodayData: {
            ApiKeys.name: name,
            ApiKeys.phone: phone,
            ApiKeys.email: emaile,
            ApiKeys.password: password,
            ApiKeys.confirmPassword: confirmPassword,
            ApiKeys.location:
                '{"name":"methalfa","address":"meet halfa","coordinates":[30.1572709,31.224779]}',
            ApiKeys.profilePic: await uploadImageToAPI(image)
          },
          isFromData: true);
      final signUpModel = SignUpModel.fromJson(response);
      return Right(signUpModel);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  Future<Either<String, UserModel>> getUserProfile() async {
    try {
      final response = await sl<ApiConsumer>().get(
        EndPoints.getUserData(sl<CacheHelper>().getData(key: ApiKeys.id)),
      );
      final user = UserModel.fromJson(response);
      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  Future<Either<String, EditOrDeleteUserModel>> updateUserProfile(
      {required String name,
      required String phone,
      required XFile image}) async {
    try {
      final response = await sl<ApiConsumer>().patch(
        EndPoints.updateUser,
        isFromData: true,
        bodayData: {
          ApiKeys.name: name,
          ApiKeys.phone: phone,
          ApiKeys.location:
              '{"name":"methalfa","address":"meet halfa","coordinates":[30.1572709,31.224779]}',
          ApiKeys.profilePic: await uploadImageToAPI(image)
        },
      );
      final updateUser = EditOrDeleteUserModel.fromJson(response);
      return Right(updateUser);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  Future<Either<String, EditOrDeleteUserModel>> deleteUser() async {
    try {
      final response = await sl<ApiConsumer>().delete(
        EndPoints.deleteUser,
        queryParameters: {
          ApiKeys.id: sl<CacheHelper>().getData(key: ApiKeys.id),
        },
      );
      sl<CacheHelper>().removeData(key: ApiKeys.id);
      sl<CacheHelper>().removeData(key: ApiKeys.token);
      final deleteUserModel = EditOrDeleteUserModel.fromJson(response);
      return Right(deleteUserModel);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }
}
