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
                    vertical: 131.v,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 25.v),
                      Center(
                          child: Text(
                            "lbl_inscription".tr,
                            style: theme.textTheme.headlineLarge,
                          )
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
                      SizedBox(height: 30.v),
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
      padding: EdgeInsets.only(right: 25.h), // Adjust padding as needed
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 1.h), // Adjust left padding if needed
            child: Selector<SignUpPageProvider, TextEditingController?>(
              selector: (context, provider) => provider.passwordController,
              builder: (context, passwordController, child) {
                return CustomTextFormField(
                  controller: passwordController,
                  hintText: "lbl_mot_de_passe".tr,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "err_msg_please_enter_password".tr; // Clear message for empty password
                    } else if (value.length < 9) {
                      return "err_msg_password_too_short".tr; // Specific message for short password
                    } else if (!RegExp(r'[0-9]').hasMatch(value)) {
                      return "err_msg_password_missing_digit".tr; // Message for missing digit
                    }
                    return null; // Valid password
                  },
                );
              },
            ),
          ),
          SizedBox(height: 8.v), // Add some spacing for better readability (optional)
          Text(
            "msg_9_caract_res_dont".tr, // Assuming translation exists
            style: Theme.of(context).textTheme.caption?.copyWith( // Use theme's caption style
              color: Colors.grey, // Adjust color as needed
              fontSize: 15.v, // Adjust font size as needed
            ),
          ), // Informative text about password requirement
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