import 'package:flutter/material.dart';
import '../../core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomeTextFormField extends StatefulWidget {
  const CustomeTextFormField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    required this.validate,
    this.textInputAction,
    this.inputType = TextInputType.text,
    this.suffixIcon = false,
    this.obscureText = false,
  });

  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validate;
  final TextInputAction? textInputAction;
  final TextInputType? inputType;
  final bool suffixIcon;
  final bool obscureText;

  @override
  State<CustomeTextFormField> createState() => _CustomeTextFormFieldState();
}

class _CustomeTextFormFieldState extends State<CustomeTextFormField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.bold,
              ),
        ),
        SizedBox(
          height: 10.h,
        ),
        TextFormField(
            controller: widget.controller,
            obscureText: (widget.obscureText && _obscureText),
            keyboardType: widget.inputType,
            textInputAction: widget.textInputAction ?? TextInputAction.next,
            decoration: InputDecoration(
              suffixIcon: widget.suffixIcon
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      icon: _obscureText
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off))
                  : null,
              hintText: widget.hintText,
              hintStyle: const TextStyle(
                color: AppColors.grey,
              ),
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: widget.validate),
      ],
    );
  }
}
