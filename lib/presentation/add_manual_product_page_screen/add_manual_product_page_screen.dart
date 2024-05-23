import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'provider/add_manual_product_page_provider.dart';
import '../../theme/custom_text_field.dart';
import '../../theme/custom_text_style.dart';

class AddManualProductPageScreen extends StatefulWidget {
  const AddManualProductPageScreen({Key? key})
      : super(
      key: key
  );

  @override
  AddManualProductPageScreenState createState() => AddManualProductPageScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddManualProductPageProvider(),
      child: AddManualProductPageScreen(),
    );
  }
}

class AddManualProductPageScreenState extends State<AddManualProductPageScreen> {
  int quantity = 1; // Initialisation de la quantité
  final TextEditingController textFieldBarCode = TextEditingController();
  final TextEditingController textFieldDlc = TextEditingController();
  final TextEditingController textFieldQuantity = TextEditingController();

  void incrementQuantity() {
    setState(() {
      quantity++;
      textFieldQuantity.text = quantity.toString();
    });
  }

  void decrementQuantity() {
    if (quantity > 0) { // Assurer que la quantité ne devient pas négative
      setState(() {
        quantity--;
        textFieldQuantity.text = quantity.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(240, 255, 244, 1),
        appBar: _buildAppBar(context),
        body: SingleChildScrollView( // Utilisez un SingleChildScrollView ici
          child: Stack(
            children: [
              Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Text(
                              "Code barre produit",
                              style: CustomTextStyles.displayMediumBlack900.copyWith(
                                fontSize: 35.0,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 25),
                            child: TextField(
                              controller: textFieldBarCode,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              decoration: CustomTextFieldStyles.filledGreen.copyWith(
                                hintText: "3133494006006",
                                hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                              ),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 22.0,
                              ),
                            ),
                          ),
                          SizedBox(height: 80),
                          Text(
                            "DLC",
                            style: CustomTextStyles.displayMediumBlack900.copyWith(
                              fontSize: 35.0,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 25),
                            child: TextField(
                              controller: textFieldDlc,
                              decoration: CustomTextFieldStyles.filledGreen.copyWith(
                                hintText: "15/06/24",
                                hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                              ),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 22.0,
                              ),
                            ),
                          ),
                          SizedBox(height: 80),
                          Text(
                            "Quantité",
                            style: CustomTextStyles.displayMediumBlack900.copyWith(
                              fontSize: 35.0,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 120),
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 3,
                                      offset: Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: decrementQuantity,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 40),
                              Container(
                                width: 70,
                                height: 70,
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: TextField(
                                  controller: textFieldQuantity,
                                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  textAlign: TextAlign.center,
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      setState(() {
                                        quantity = int.parse(value);
                                      });
                                    }
                                  },
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide(width: 1.0, color: Colors.black),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide(width: 1.0, color: Colors.black),
                                    ),
                                    hintStyle: TextStyle(color: Colors.grey),
                                  ),
                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 22.0),
                                ),
                              ),
                              SizedBox(width: 40),
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 3,
                                      offset: Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: incrementQuantity,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 105,
                    decoration: BoxDecoration(
                      color: appTheme.green500,
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 16,
                left: 20,
                right: 20,
                child: ElevatedButton(
                  onPressed: () {
                    int textFieldBarCodeValue = int.parse(textFieldBarCode.text);
                    String textFieldDlcValue = textFieldDlc.text;
                    int textFieldQuantityValue = int.parse(textFieldQuantity.text);
                    print("Integer TextField Value: $textFieldBarCodeValue");
                    print("General TextField Value: $textFieldDlcValue");
                    print("General TextField Value: $textFieldQuantityValue");

                    // Nettoyer les champs TextField
                    textFieldBarCode.clear();
                    textFieldDlc.clear();
                    textFieldQuantity.clear();
                    setState(() {
                      quantity = 1;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 30),
                  ),
                  child: Text(
                    "Valider",
                    style: CustomTextStyles.headlineSmallBlack900_1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: AppbarSubtitleOne(
        text: "Ajout Produit".tr,
        margin: EdgeInsets.only(left: 22.h),
      ),
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
      styleType: Style.bgFill,
    );
  }

 void onTapBackbuttonone(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.mainPageScreen,
    );
  }
}


