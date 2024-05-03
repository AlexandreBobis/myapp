import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/mainpage_item_model.dart'; // ignore: must_be_immutable
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class MainpageItemWidget extends StatelessWidget {
  MainpageItemWidget(this.mainpageItemModelObj, {Key? key})
      : super(
          key: key,
        );

  MainpageItemModel mainpageItemModelObj;

  @override
  Widget build(BuildContext context) {
    return CustomImageView(
      imagePath: mainpageItemModelObj.polygon!,
      height: 142.v,
      width: 86.h,
    );
  }
}
