import 'package:flutter/material.dart';
import '../core/app_export.dart';

class CustomTextFieldStyles {
  static InputDecoration get filledBlack => InputDecoration(
    fillColor: appTheme.black900,
    filled: true,
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.h),
      borderSide: BorderSide.none,
    ),
  );

  // Style de champ de texte rempli en vert
  static InputDecoration get filledGreen => InputDecoration(
    fillColor: appTheme.green500,
    filled: true,
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.h),
      borderSide: BorderSide.none,
    ),
  );

  // Style de champ de texte transparent
  static InputDecoration get transparent => InputDecoration(
    fillColor: Colors.transparent,
    filled: false,
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.h),
      borderSide: BorderSide.none,
    ),
  );
}