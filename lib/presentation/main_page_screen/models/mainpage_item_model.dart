import '../../../core/app_export.dart';

/// This class is used in the [mainpage_item_widget] screen.
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class MainpageItemModel {
  MainpageItemModel({this.polygon, this.id}) {
    polygon = polygon ?? ImageConstant.imgPolygon1;
    id = id ?? "";
  }

  String? polygon;

  String? id;
}
