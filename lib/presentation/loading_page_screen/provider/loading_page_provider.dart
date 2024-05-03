import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/loading_page_model.dart';

/// A provider class for the LoadingPageScreen.
///
/// This provider manages the state of the LoadingPageScreen, including the
/// current loadingPageModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class LoadingPageProvider extends ChangeNotifier {
  LoadingPageModel loadingPageModelObj = LoadingPageModel();

  @override
  void dispose() {
    super.dispose();
  }
}
