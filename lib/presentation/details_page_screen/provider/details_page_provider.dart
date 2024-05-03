import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/details_page_model.dart';

/// A provider class for the DetailsPageScreen.
///
/// This provider manages the state of the DetailsPageScreen, including the
/// current detailsPageModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class DetailsPageProvider extends ChangeNotifier {
  DetailsPageModel detailsPageModelObj = DetailsPageModel();

  @override
  void dispose() {
    super.dispose();
  }
}
