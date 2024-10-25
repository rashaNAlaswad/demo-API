  import 'package:flutter/material.dart';

import '../../core/helpers/functions.dart';
import 'custome_text_form_field.dart';

Widget buildConfirmPasswordFormField({required TextEditingController controller}) {
    return CustomeTextFormField(
      labelText: 'Confirm Password',
      hintText: '*******',
      obscureText: true,
      suffixIcon: true,
      controller: controller,
      validate: (value) => validatePassword(value),
    );
  }

  Widget buildPasswordFormField({required TextEditingController controller}) {
    return CustomeTextFormField(
      labelText: 'Password',
      hintText: '*******',
      obscureText: true,
      suffixIcon: true,
      controller: controller,
      validate: validatePassword,
    );
  }

  Widget buildPhoneNumberFormField({required TextEditingController controller}) {
    return CustomeTextFormField(
      labelText: 'Phone Number',
      hintText: '+970123456789',
      obscureText: false,
      inputType: TextInputType.phone,
      controller: controller,
      validate: (value) => validatePhone(value),
    );
  }

  Widget buildEmailFormField({required TextEditingController controller}) {
    return CustomeTextFormField(
      labelText: 'Email',
      hintText: 'example@gmail.com',
      obscureText: false,
      inputType: TextInputType.emailAddress,
      controller: controller,
      validate: (value) => validateEmail(value),
    );
  }

  Widget buildNameFormField({required TextEditingController controller}) {
    return CustomeTextFormField(
      labelText: 'Name',
      hintText: 'Rasha Naser',
      obscureText: false,
      controller: controller,
      validate: (value) => validateUserName(value),
    );
  }