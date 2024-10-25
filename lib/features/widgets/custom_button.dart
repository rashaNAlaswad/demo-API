import 'package:flutter/material.dart';
import '../../core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.label,
      required this.onPressed,
      this.color = AppColors.primary});

  final String label;
  final Color color;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(60.h), backgroundColor: color),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(label, style: Theme.of(context).textTheme.displayMedium!),
      ),
    );
  }
}
