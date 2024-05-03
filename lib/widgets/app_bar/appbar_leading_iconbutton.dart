import 'package:flutter/material.dart';
import '../../core/app_export.dart'; // ignore: must_be_immutable
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class AppbarLeadingIconbutton extends StatelessWidget {
  AppbarLeadingIconbutton({Key? key, this.imagePath, this.margin, this.onTap})
      : super(
          key: key,
        );

  String? imagePath;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: IconButton(
          onPressed: () {},
          constraints: BoxConstraints(
            minHeight: 75.v,
            minWidth: 75.h,
          ),
          padding: EdgeInsets.all(0),
          icon: SizedBox(
            width: 75.h,
            height: 51.v,
            child: CustomImageView(
              imagePath: ImageConstant.imageNotFound,
            ),
          ),
        ),
      ),
    );
  }
}
