import 'package:flutter/material.dart';
import '../core/app_export.dart';

extension on TextStyle {
  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }
}

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.
class CustomTextStyles {
  // Display text style
  static get displayMedium48 => theme.textTheme.displayMedium!.copyWith(
        fontSize: 48.fSize,
      );
  static get displayMediumBlack900 => theme.textTheme.displayMedium!.copyWith(
        color: appTheme.black900,
        fontSize: 42.fSize,
        fontWeight: FontWeight.w100,
      );
  static get displayMediumBlack900_1 => theme.textTheme.displayMedium!.copyWith(
        color: appTheme.black900,
      );
// Headline text style
  static get headlineSmallBlack900 => theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.black900,
        fontSize: 24.fSize,
        fontWeight: FontWeight.w300,
      );
  static get headlineSmallBlack900_1 => theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.black900,
      );
  static get headlineSmallGreen500 => theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.green500,
      );
// Title text style
  static get titleLargeMedium => theme.textTheme.titleLarge!.copyWith(
        fontSize: 23.fSize,
        fontWeight: FontWeight.w500,
      );
}
