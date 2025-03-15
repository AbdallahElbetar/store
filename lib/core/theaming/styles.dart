import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store/core/theaming/colors.dart';

abstract class Styles {
  static final textStyleBlack32 = TextStyle(
      fontSize: 26.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.myBlack,
      fontFamily: GoogleFonts.readexPro().fontFamily);
  static final textStyleGrey16 = TextStyle(
      fontSize: 16.sp, fontWeight: FontWeight.w400, color: AppColors.myGrey);
  static final textStyleBlack16 = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.myBlack,
      fontFamily: GoogleFonts.readexPro().fontFamily);
  static final textStyleWhite14 = TextStyle(
      fontSize: 14.sp, fontWeight: FontWeight.w500, color: AppColors.myWhite);
}
