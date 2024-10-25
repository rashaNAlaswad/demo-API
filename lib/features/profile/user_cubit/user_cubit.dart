import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../models/user_model.dart';
import '../../repository/user_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.userRepository) : super(UserInitial());

  final UserRepository userRepository;

  getUserData() async {
    emit(GetUserLoading());
    final response = await userRepository.getUserProfile();
    response.fold(
      (errMessage) => emit(GetUserFailure(errorMessage: errMessage)),
      (user) => emit(GetUserSuccess(user: user)),
    );
  }

  deleteUser() async {
    final response = await userRepository.deleteUser();
    response.fold(
      (errMessage) => emit(UpdateUserFailure(errorMessage: errMessage)),
      (message) => emit(UpdateUserSuccessd(message: message.message)),
    );
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

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

  void editProfile() async {
    if (pickedImage == null) {
      emit(UpdateUserFailure(errorMessage: "No image selected"));
      return;
    }
    emit(ImagePicked(image: pickedImage!));

    emit(UpdateUserLoading());
    final response = await userRepository.updateUserProfile(
      name: nameController.text,
      phone: phoneController.text,
      image: pickedImage!,
    );
    response
        .fold((errMessage) => emit(UpdateUserFailure(errorMessage: errMessage)),
            (message) {
      emit(UpdateUserSuccessd(message: message.message));
    });
  }

  void resetControllers() {
    nameController.clear();
    phoneController.clear();
  }
}
