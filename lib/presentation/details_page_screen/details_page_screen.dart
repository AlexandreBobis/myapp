import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'models/details_page_model.dart';
import 'provider/details_page_provider.dart';

class DetailsPageScreen extends StatefulWidget {
  const DetailsPageScreen({Key? key})
      : super(
    key: key,
  );

  @override
  DetailsPageScreenState createState() => DetailsPageScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DetailsPageProvider(),
      child: DetailsPageScreen(),
    );
  }
}

class DetailsPageScreenState extends State<DetailsPageScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 15.v),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 107.h),
                  padding: EdgeInsets.symmetric(vertical: 31.v),
                  decoration: AppDecoration.fillBlueGray,
                  child: Column(
                    children: [
                      SizedBox(height: 14.v),
                      SizedBox(
                        width: 175.h,
                        child: Text(
                          "msg_photo_de_l_article".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.displayMediumBlack900_1,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 17.v),
                Text(
                  "lbl_nom_produit".tr,
                  style: theme.textTheme.headlineLarge,
                ),
                SizedBox(height: 11.v),
                Text(
                  "lbl_dlc".tr,
                  style: CustomTextStyles.headlineSmallBlack900,
                ),
                SizedBox(height: 18.v),
                Text(
                  "lbl_quantit".tr,
                  style: CustomTextStyles.headlineSmallBlack900,
                ),
                SizedBox(height: 40.v),
                _buildColumnDescription(context),
                SizedBox(height: 80.v),
                _buildColumnJoursCount(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 100.h,
      leading: AppbarLeadingIconbutton(
        margin: EdgeInsets.only(
          left: 25.h,
          top: 18.v,
          bottom: 14.v,
        ),
        onTap: () {
          onTapBackbuttonone(context);
        },
      ),
      title: AppbarSubtitleOne(
        text: "lbl_perim_app".tr,
        margin: EdgeInsets.only(left: 66.h),
      ),
      styleType: Style.bgFill,
    );
  }

  /// Section Widget
  Widget _buildColumnDescription(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25.h),
      padding: EdgeInsets.symmetric(
        horizontal: 13.h,
        vertical: 29.v,
      ),
      decoration: AppDecoration.fillBlueGray,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 4.v),
          SizedBox(
            width: 310.h,
            child: Text(
              "msg_lorem_ipsum_dolor".tr,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.headlineSmallBlack900,
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnJoursCount(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 134.h,
        vertical: 17.v,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: fs.Svg(
            ImageConstant.imgGroup11,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Text(
            "lbl_2_jours".tr,
            style: theme.textTheme.displaySmall,
          )
        ],
      ),
    );
  }

  /// Navigates to the mainPageScreen when the action is triggered.
  onTapBackbuttonone(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.mainPageScreen,
    );
  }
}