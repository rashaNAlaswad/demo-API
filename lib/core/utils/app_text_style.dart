import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

TextStyle _textStyle({
  required Color color,
  required double fontSize,
  required FontWeight fontWeight,
}) {
  return GoogleFonts.poppins(
    color: color,
    fontSize: fontSize.sp,
    fontWeight: fontWeight,
  );
}

// Bold Style
TextStyle boldStyle({
  Color color = AppColors.black,
  double fontSize = 18,
}) {
  return _textStyle(
    color: color,
    fontSize: fontSize.sp,
    fontWeight: FontWeight.bold,
  );
}

// Semi Bold Style
TextStyle semiBoldStyle({
  Color color = AppColors.white,
  double fontSize = 16,
}) {
  return _textStyle(
    color: color,
    fontSize: fontSize.sp,
    fontWeight: FontWeight.w600,
  );
}

// Regular Style
TextStyle regularStyle({
  Color color = AppColors.black,
  double fontSize = 12,
}) {
  return _textStyle(
    color: color,
    fontSize: fontSize.sp,
    fontWeight: FontWeight.w400,
  );
}
