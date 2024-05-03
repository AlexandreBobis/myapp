import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/main_page_model.dart';
import '../models/mainpage_item_model.dart';

/// A provider class for the MainPageScreen.
///
/// This provider manages the state of the MainPageScreen, including the
/// current mainPageModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class MainPageProvider extends ChangeNotifier {
  MainPageModel mainPageModelObj = MainPageModel();

  @override
  void dispose() {
    super.dispose();
  }
}
