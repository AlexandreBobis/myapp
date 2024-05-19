import 'package:flutter/material.dart';
import '../../core/app_export.dart'; // ignore: must_be_immutable
// ignore_for_file: must_be_immutable

class AppbarLeadingIconbutton extends StatelessWidget {
  AppbarLeadingIconbutton({Key? key, this.imagePath, this.margin, this.onTap})
      : super(key: key);

  String? imagePath;
  EdgeInsetsGeometry? margin;
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: margin?? EdgeInsets.zero,
        child: SizedBox(
          width: 75.h,
          height: 51.v,
          child: CustomImageView(
            imagePath: imagePath?? ImageConstant.imageNotFound,
          ),
        ),
      ),
    );
  }
}
