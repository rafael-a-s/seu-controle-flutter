import 'package:clean_architeture_flutter/features/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppDefaults {
  static const double radius = 15;
  static const double margin = 15;
  static const double padding = 15;

  //Userd for padding
  static EdgeInsets padinngDefault = const EdgeInsets.only(
    left: 15,
    right: 15,
  );

  /// Used For Border Radius
  static BorderRadius borderRadius = BorderRadius.circular(radius);

  static BorderRadius borderRadiusCircle = BorderRadius.circular(50);

  /// Used For Bottom Sheet
  static BorderRadius bottomSheetRadius = const BorderRadius.only(
    topLeft: Radius.circular(radius),
    topRight: Radius.circular(radius),
  );

  /// Used For Top Sheet
  static BorderRadius topSheetRadius = const BorderRadius.only(
    bottomLeft: Radius.circular(radius),
    bottomRight: Radius.circular(radius),
  );

  /// Default Box Shadow used for containers
  static List<BoxShadow> boxShadow = [
    BoxShadow(
      blurRadius: 10,
      spreadRadius: 0,
      offset: const Offset(0, 2),
      color: Colors.black.withOpacity(0.04),
    ),
  ];

  static TextStyle textStyleHeader1 = GoogleFonts.getFont(
    'Poppins',
    color: AppColors.white,
    fontWeight: FontWeight.bold,
    fontSize: 30,
  );

  static TextStyle textStyleHeader2 = const TextStyle(
    color: Color.fromARGB(255, 255, 255, 255),
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );

  static TextStyle textStyleHeader3 = const TextStyle(
    color: Color.fromARGB(255, 255, 255, 255),
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static TextStyle textParagraph = GoogleFonts.getFont(
    'Poppins',
    color:  AppColors.white,
    fontWeight: FontWeight.w500,
    fontSize: 15,
  );

  static TextStyle textParagraphOpacity = GoogleFonts.getFont(
    'Poppins',
    color:  AppColors.white.withOpacity(.6),
    fontWeight: FontWeight.w500,
    fontSize: 15,
  );

  static TextStyle textStyleDefault = const TextStyle(
    color: AppColors.textInputBackground,
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );

  static TextStyle textPlaceholderStyleDefault = GoogleFonts.getFont(
    'Poppins',
    color: const Color.fromARGB(255, 2, 2, 2).withOpacity(.6),
    fontWeight: FontWeight.bold,
    fontSize: 17,
  );

  static TextStyle textStyleBalance = GoogleFonts.getFont(
    'Poppins',
    color: AppColors.white,
    fontWeight: FontWeight.bold,
    fontSize: 30,
  );

  static TextStyle textStyleBalanceMinimun = GoogleFonts.getFont(
    'Poppins',
    color: AppColors.white,
    fontWeight: FontWeight.bold,
    fontSize: 17,
  );

  static TextStyle textStylePorcent = GoogleFonts.getFont(
    'Poppins',
    color: AppColors.white,
    fontWeight: FontWeight.bold,
    fontSize: 17,
  );

  static SizedBox sizedBox = const SizedBox(
    height: 30,
  );

  static Duration duration = const Duration(milliseconds: 300);
}
