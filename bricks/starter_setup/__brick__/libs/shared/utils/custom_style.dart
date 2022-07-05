import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class AppStyles {
  static var focusBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(14.r),
    borderSide:
        BorderSide(color: AppColors.inputFieldBorderColor, width: 0.3.w),
  );
  static var focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(14.r),
    borderSide:
        BorderSide(color: AppColors.inputFieldBorderColor, width: 0.3.w),
  );

  static var focusErrorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(14.r),
    borderSide: BorderSide(color: AppColors.inputErrorBorder),
  );
}