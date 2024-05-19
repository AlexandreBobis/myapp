import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'models/details_page_model.dart';
import 'provider/details_page_provider.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../../utils/color.dart';


class DetailsPageScreen extends StatefulWidget {
  const DetailsPageScreen({Key? key})
      : super(
    key: key,
  );

  @override
  DetailsPageScreenState createState() => DetailsPageScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DetailsPageProvider(),
      child: DetailsPageScreen(),
    );
  }
}

class DetailsPageScreenState extends State<DetailsPageScreen> {
  int? productId;
  Product? product;
  int? daysDifference;


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _getProductId();
  }


  Future<void> _getProductId() async {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    if (args.containsKey('id') && args.containsKey('daysDifference')) {
      setState(() {
        productId = args['id'];
        daysDifference = args['daysDifference'];
        _getProductDetails(productId ?? 0);
        print("ID du produit sélectionné : $productId");
        print("Jours restant du produit sélectionné : $daysDifference");
      });
    }
  }


  Future<void> _getProductDetails(int id) async {
    final jsonString = await rootBundle.loadString('assets/mock/products.json');
    final jsonData = jsonDecode(jsonString);
    final products = jsonData['products'];

    for (var productData in products) {
      if (productData['id'] == id) {
        setState(() {
          product = Product.fromJson(productData);
          print("Nom du produit : ${product?.name}");
          print("Image du produit : ${product?.image}");
        });
        break;
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    //final productId = ModalRoute.of(context)!.settings.arguments as int?;
   // print("ID du produit sélectionné : $productId");
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 15.v),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 107.h),
                  padding: EdgeInsets.symmetric(vertical: 31.v),
                  decoration: AppDecoration.fillBlueGray,
                  child: Column(
                    children: [
                      SizedBox(height: 14.v),
                      SizedBox(
                        width: 175.v,
                        child: Image.network(
                          product?.image ??
                          "msg_photo_de_l_article".tr,
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 17.v),
                Text(
                  product?.name ?? "lbl_nom_produit".tr,
                  style: theme.textTheme.headlineLarge,
                ),
                SizedBox(height: 11.v),
                Text(
                  product?.dlc ?? "lbl_dlc".tr,
                  style: CustomTextStyles.headlineSmallBlack900,
                ),
                SizedBox(height: 18.v),
                Text(
                  product?.quantity.toString() ?? "lbl_quantit".tr,
                  style: CustomTextStyles.headlineSmallBlack900,
                ),
                SizedBox(height: 40.v),
                _buildColumnDescription(context),
                SizedBox(height: 80.v),
                _buildColumnJoursCount(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 100.h,
      leading: AppbarLeadingIconbutton(
        margin: EdgeInsets.only(
          left: 25.h,
          top: 18.v,
          bottom: 14.v,
        ),
        onTap: () {
          onTapBackbuttonone(context);
        },
      ),
      title: AppbarSubtitleOne(
        text: "lbl_perim_app".tr,
        margin: EdgeInsets.only(left: 66.h),
      ),
      styleType: Style.bgFill,
    );
  }

  /// Section Widget
  Widget _buildColumnDescription(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25.h),
      padding: EdgeInsets.symmetric(
        horizontal: 13.h,
        vertical: 29.v,
      ),
      decoration: AppDecoration.fillBlueGray,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 4.v),
          SizedBox(
            width: 310.h,
            child: Text(
              product?.conservationConditions ?? "msg_lorem_ipsum_dolor".tr,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.headlineSmallBlack900,
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnJoursCount(BuildContext context) {
    return Center (
      child: Container(
      padding: EdgeInsets.symmetric(
        vertical: 17.v,
      ),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle, // Forme du conteneur
          borderRadius: BorderRadius.only( // Coins arrondis
            topLeft: Radius.circular(100), // Rayon du cercle
            topRight: Radius.circular(100), // Rayon du cercle
          ),
          color: getColorByDaysDifference(daysDifference ?? 0), // Couleur du demi-cercle
        ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 10.v),
          Text(
            '${daysDifference?.toString() ?? "lbl_nb_jour".tr} '
                '${(daysDifference ?? 0) > 1 ? "jours" : "jour"}',
            style: theme.textTheme.displaySmall,
           )
         ],
        ),
      ),
    );
  }

  /// Navigates to the mainPageScreen when the action is triggered.
  onTapBackbuttonone(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.mainPageScreen,
    );
  }
}