import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/sign_up_page_model.dart';

/// A provider class for the SignUpPageScreen.
///
/// This provider manages the state of the SignUpPageScreen, including the
/// current signUpPageModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class SignUpPageProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();

  SignUpPageModel signUpPageModelObj = SignUpPageModel();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }
}
