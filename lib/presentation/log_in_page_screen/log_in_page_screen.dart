import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'models/log_in_page_model.dart';
import 'provider/log_in_page_provider.dart';

class LogInPageScreen extends StatefulWidget {
  const LogInPageScreen({Key? key})
      : super(
          key: key,
        );

  @override
  LogInPageScreenState createState() => LogInPageScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LogInPageProvider(),
      child: LogInPageScreen(),
    );
  }
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class LogInPageScreenState extends State<LogInPageScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.green500,
        resizeToAvoidBottomInset: false,
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
                    horizontal: 33.h,
                    vertical: 61.v,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(
                        flex: 53,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 6.h),
                        child: Text(
                          "lbl_perim_app".tr,
                          style: theme.textTheme.displayLarge,
                        ),
                      ),
                      SizedBox(height: 63.v),
                      Padding(
                        padding: EdgeInsets.only(left: 2.h),
                        child:
                            Selector<LogInPageProvider, TextEditingController?>(
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
                              borderDecoration:
                                  TextFormFieldStyleHelper.underLinePrimary,
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 33.v),
                      Padding(
                        padding: EdgeInsets.only(left: 2.h),
                        child: Text(
                          "lbl_mot_de_passe".tr,
                          style: theme.textTheme.headlineSmall,
                        ),
                      ),
                      SizedBox(height: 3.v),
                      Divider(
                        color: theme.colorScheme.primary,
                        indent: 1.h,
                      ),
                      Spacer(
                        flex: 46,
                      ),
                      CustomElevatedButton(
                        text: "lbl_suivant".tr,
                        margin: EdgeInsets.only(
                          left: 10.h,
                          right: 5.h,
                        ),
                        buttonTextStyle: CustomTextStyles.headlineSmallGreen500,
                        onPressed: () {
                          onTapSuivant(context);
                        },
                      ),
                      SizedBox(height: 23.v),
                      CustomElevatedButton(
                        text: "lbl_retour".tr,
                        margin: EdgeInsets.only(
                          left: 10.h,
                          right: 5.h,
                        ),
                        buttonStyle: CustomButtonStyles.fillBlack,
                        onPressed: () {
                          onTapRetour(context);
                        },
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
