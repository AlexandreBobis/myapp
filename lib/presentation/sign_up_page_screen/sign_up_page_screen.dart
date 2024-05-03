import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'models/sign_up_page_model.dart';
import 'provider/sign_up_page_provider.dart';

class SignUpPageScreen extends StatefulWidget {
  const SignUpPageScreen({Key? key})
      : super(
          key: key,
        );

  @override
  SignUpPageScreenState createState() => SignUpPageScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignUpPageProvider(),
      child: SignUpPageScreen(),
    );
  }
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class SignUpPageScreenState extends State<SignUpPageScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: SizedBox(
              height: SizeUtils.height,
              child: Form(
                key: _formKey,
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.h,
                    vertical: 61.v,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 25.v),
                      Padding(
                        padding: EdgeInsets.only(left: 88.h),
                        child: Text(
                          "lbl_inscription".tr,
                          style: theme.textTheme.headlineLarge,
                        ),
                      ),
                      Spacer(
                        flex: 49,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 36.h),
                        child: Selector<SignUpPageProvider,
                            TextEditingController?>(
                          selector: (context, provider) =>
                              provider.emailController,
                          builder: (context, emailController, child) {
                            return CustomTextFormField(
                              controller: emailController,
                              hintText: "lbl_e_mail".tr,
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null ||
                                    (!isValidEmail(value, isRequired: true))) {
                                  return "err_msg_please_enter_valid_email".tr;
                                }
                                return null;
                              },
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 36.v),
                      _buildAskMdp(context),
                      SizedBox(height: 30.v),
                      Text(
                        "msg_confirmer_le_mot".tr,
                        style: CustomTextStyles.headlineSmallBlack900_1,
                      ),
                      SizedBox(height: 2.v),
                      Divider(
                        endIndent: 36.h,
                      ),
                      SizedBox(height: 8.v),
                      Padding(
                        padding: EdgeInsets.only(left: 5.h),
                        child: Text(
                          "msg_9_caract_res_dont".tr,
                          style: theme.textTheme.bodyLarge,
                        ),
                      ),
                      Spacer(
                        flex: 50,
                      ),
                      CustomElevatedButton(
                        text: "lbl_suivant".tr,
                        margin: EdgeInsets.only(
                          left: 24.h,
                          right: 25.h,
                        ),
                        buttonStyle: CustomButtonStyles.fillGreen,
                        onPressed: () {
                          onTapSuivant(context);
                        },
                        alignment: Alignment.center,
                      ),
                      SizedBox(height: 22.v),
                      CustomElevatedButton(
                        text: "lbl_retour".tr,
                        margin: EdgeInsets.only(
                          left: 24.h,
                          right: 25.h,
                        ),
                        buttonStyle: CustomButtonStyles.fillBlack,
                        onPressed: () {
                          onTapRetour(context);
                        },
                        alignment: Alignment.center,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      centerTitle: true,
      title: AppbarTitle(
        text: "lbl_perim_app".tr,
      ),
      styleType: Style.bgFill,
    );
  }

  /// Section Widget
  Widget _buildAskMdp(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 25.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 1.h),
            child: Text(
              "lbl_mot_de_passe".tr,
              style: CustomTextStyles.headlineSmallBlack900_1,
            ),
          ),
          SizedBox(height: 3.v),
          Divider(
            endIndent: 12.h,
          ),
          SizedBox(height: 6.v),
          Padding(
            padding: EdgeInsets.only(left: 5.h),
            child: Text(
              "msg_9_caract_res_dont".tr,
              style: theme.textTheme.bodyLarge,
            ),
          )
        ],
      ),
    );
  }

  /// Navigates to the mainPageScreen when the action is triggered.
  onTapSuivant(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.mainPageScreen,
    );
  }

  /// Navigates to the loadingPageScreen when the action is triggered.
  onTapRetour(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loadingPageScreen,
    );
  }
}
