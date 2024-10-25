import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../repository/user_repository.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.userRepository) : super(SignupInitial());

  final UserRepository userRepository;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final TextEditingController emaileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  XFile? pickedImage;
  final ImagePicker _picker = ImagePicker();
  Future<void> pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        pickedImage = image;
        emit(ImagePicked(image: image));
      } else {
        emit(ImageFailure("No image selected"));
      }
    } catch (e) {
      emit(ImageFailure("Failed to pick image: $e"));
    }
  }

  void signup() async {
    if (pickedImage == null) {
      emit(SignupFailure(errorMessage: "No image selected"));
      return;
    }
    emit(ImagePicked(image: pickedImage!));

    emit(SignupLoading());
    final response = await userRepository.signUp(
        name: nameController.text,
        phone: phoneController.text,
        emaile: emaileController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
        image: pickedImage!);
    response.fold((errMessage) => emit(SignupFailure(errorMessage: errMessage)),
        (signupModel) => emit(SignupSuccess(message: signupModel.message)));
  }
}
