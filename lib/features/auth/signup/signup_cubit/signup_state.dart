part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupSuccess extends SignupState {
  final String message;
  SignupSuccess({required this.message});
}

class ImagePicked extends SignupState {
  final XFile image;
  ImagePicked({required this.image});
}

class ImageFailure extends SignupState {
  final String message;
  ImageFailure(this.message);
}

final class SignupFailure extends SignupState {
  final String errorMessage;
  SignupFailure({required this.errorMessage});
}
