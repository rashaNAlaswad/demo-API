part of 'user_cubit.dart';

@immutable
sealed class UserState {}

/// User States

final class UserInitial extends UserState {}

final class GetUserLoading extends UserState {}

final class GetUserSuccess extends UserState {
  final UserModel user;

  GetUserSuccess({required this.user});
}

final class GetUserFailure extends UserState {
  final String errorMessage;

  GetUserFailure({required this.errorMessage});
}

/// Update User States
final class UpdateUserLoading extends UserState {}

final class UpdateUserSuccessd extends UserState {
  final String message;

  UpdateUserSuccessd({required this.message});
}

class ImagePicked extends UserState {
  final XFile image;
  ImagePicked({required this.image});
}

class ImageFailure extends UserState {
  final String message;
  ImageFailure(this.message);
}

final class UpdateUserFailure extends UserState {
  final String errorMessage;

  UpdateUserFailure({required this.errorMessage});
}

/// Delete User States
final class DeleteUserSuccessd extends UserState {
  final String message;

  DeleteUserSuccessd({required this.message});
}

final class DeleteUserFailure extends UserState {
  final String errorMessage;

  DeleteUserFailure({required this.errorMessage});
}
