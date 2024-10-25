import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'package:image_picker/image_picker.dart';

Future uploadImageToAPI(XFile image) async {
  return MultipartFile.fromFile(image.path,
      filename: image.path.split('/').last);
}

String? validateUserName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Name is required';
  } else if (value.length < 3) {
    return 'Name must be at least 3 characters';
  } else {
    return null;
  }
}

String? validatePhone(String? value) {
  if (value == null || value.isEmpty) {
    return 'Phone is required';
  } else if (value.length < 10) {
    return 'Phone must be at least 10 characters';
  } else {
    return null;
  }
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password is required';
  } else if (value.length < 6) {
    return 'Password must be at least 6 characters';
  } else {
    return null;
  }
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your email address';
  } else if (!value.contains('@gmail.com')) {
    return 'Please enter a valid email address';
  }
  return null;
}

void showSnackBar(
    {required BuildContext context,
    required String message,
    required SnakeState state}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        backgroundColor: getState(state),
        content: Text(message),
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating),
  );
}

enum SnakeState { success, error }

Color getState(SnakeState state) {
  switch (state) {
    case SnakeState.error:
      return AppColors.error;
    case SnakeState.success:
      return AppColors.success;
  }
}
