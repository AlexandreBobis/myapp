import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_outlined_button.dart';
import 'models/loading_page_model.dart';
import 'provider/loading_page_provider.dart';

class LoadingPageScreen extends StatefulWidget {
  const LoadingPageScreen({Key? key})
      : super(
          key: key,
        );

  @override
  LoadingPageScreenState createState() => LoadingPageScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoadingPageProvider(),
      child: LoadingPageScreen(),
    );
  }
}

class LoadingPageScreenState extends State<LoadingPageScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top:false,
      child: Scaffold(
        backgroundColor: appTheme.green500,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 33.h,
            vertical: 60.v,
          ),
          child: Column(
            children: [
              Spacer(
                flex: 35,
              ),
              Text(
                "lbl_perim_app".tr,
                style: theme.textTheme.displayLarge,
              ),
              Spacer(
                flex: 64,
              ),
              CustomElevatedButton(
                text: "lbl_se_connecter".tr,
                margin: EdgeInsets.only(
                  left: 8.h,
                  right: 7.h,
                ),
                buttonTextStyle: CustomTextStyles.headlineSmallBlack900_1,
                onPressed: () {
                  onTapSeconnecter(context);
                },
              ),
              SizedBox(height: 21.v),
              CustomOutlinedButton(
                text: "lbl_cr_er_un_compte".tr,
                margin: EdgeInsets.only(
                  left: 8.h,
                  right: 7.h,
                ),
                onPressed: () {
                  onTapCreeruncompte(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Navigates to the logInPageScreen when the action is triggered.
  onTapSeconnecter(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.logInPageScreen,
    );
  }

  /// Navigates to the signUpPageScreen when the action is triggered.
  onTapCreeruncompte(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signUpPageScreen,
    );
  }
}
