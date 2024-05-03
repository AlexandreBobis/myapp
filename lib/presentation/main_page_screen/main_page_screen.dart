import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'models/main_page_model.dart';
import 'models/mainpage_item_model.dart';
import 'provider/main_page_provider.dart';
import 'widgets/mainpage_item_widget.dart';

class MainPageScreen extends StatefulWidget {
  const MainPageScreen({Key? key})
      : super(
          key: key,
        );

  @override
  MainPageScreenState createState() => MainPageScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainPageProvider(),
      child: MainPageScreen(),
    );
  }
}

class MainPageScreenState extends State<MainPageScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Consumer<MainPageProvider>(
          builder: (context, provider, child) {
            return ListView.separated(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 1.v,
                );
              },
              itemCount: provider.mainPageModelObj.mainpageItemList.length,
              itemBuilder: (context, index) {
                MainpageItemModel model =
                    provider.mainPageModelObj.mainpageItemList[index];
                return MainpageItemWidget(
                  model,
                );
              },
            );
          },
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: AppbarSubtitleOne(
        text: "lbl_votre_profil".tr,
        margin: EdgeInsets.only(left: 22.h),
      ),
      actions: [
        Container(
          margin: EdgeInsets.fromLTRB(16.h, 14.v, 16.h, 18.v),
          padding: EdgeInsets.symmetric(horizontal: 24.h),
          decoration: AppDecoration.fillPrimary.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder5,
          ),
          child: AppbarSubtitle(
            text: "lbl".tr,
          ),
        )
      ],
      styleType: Style.bgFill,
    );
  }
}
