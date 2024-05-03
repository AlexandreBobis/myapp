import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/log_in_page_model.dart';

/// A provider class for the LogInPageScreen.
///
/// This provider manages the state of the LogInPageScreen, including the
/// current logInPageModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class LogInPageProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();

  LogInPageModel logInPageModelObj = LogInPageModel();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }
}
