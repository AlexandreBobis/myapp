import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../details_page_screen/details_page_screen.dart';
import 'models/main_page_model.dart';
import 'models/mainpage_item_model.dart';
import 'provider/main_page_provider.dart';
import 'widgets/mainpage_item_widget.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';// Import for date formatting
import '../../utils/color.dart';



class MainPageScreen extends StatefulWidget {
  const MainPageScreen({Key? key}) : super(key: key);

  @override
  MainPageScreenState createState() => MainPageScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainPageProvider(),
      child: MainPageScreen(),
    );
  }
}

class MainPageScreenState extends State<MainPageScreen> {
  List _products = [];

  @override
  void initState() {
    super.initState();
    _readJson();
  }

  Future<void> _readJson() async {
    final String response = await rootBundle.loadString('assets/mock/products.json');
    final data = await json.decode(response);
    setState(() {
      _products = data["products"];
      _sortProductsByDaysDifference(); // Sort products on data load
    });
  }

  void _sortProductsByDaysDifference() {
    _products.sort((a, b) {
      final daysDifferenceA = _calculateDaysDifference(a["dlc"]);
      final daysDifferenceB = _calculateDaysDifference(b["dlc"]);
      return daysDifferenceA.compareTo(daysDifferenceB);
    });
  }

  // Function to calculate the difference in days between two dates
  int _calculateDaysDifference(String dlc) {
    final dateFormat = DateFormat('dd/MM/yy');
    final dlcDate = dateFormat.parse(dlc); // Parse DLC string to DateTime
    final today = DateTime.now();
    //final color = getColorByDaysDifference(daysDifference);

    // Remove time components from dates for accurate comparison
    final normalizedDlcDate = DateTime(dlcDate.year, dlcDate.month, dlcDate.day);
    final normalizedToday = DateTime(today.year, today.month, today.day);

    final difference = normalizedDlcDate.difference(normalizedToday).inDays;

    if (normalizedDlcDate.isAtSameMomentAs(normalizedToday)) {
      return 0; // Dates are the same, return 0 days difference
    } else {
      return difference.abs(); // Return absolute difference in days
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 255, 244, 1),
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('Load Data'),
              onPressed: _readJson,
            ),
            _products.isNotEmpty
                ? Expanded(
              child: ListView.builder(
                itemCount: _products.length,
                itemBuilder: (context, index) {
                  final dlc = _products[index]["dlc"] as String;
                  int daysDifference = _calculateDaysDifference(dlc);
                  final color = getColorByDaysDifference(daysDifference);
                  final textColor = color.computeLuminance() < 0.5?Colors.white:Colors.black;

                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsPageScreen(),
                          settings: RouteSettings(
                              arguments: {
                                'id': _products[index]["id"],
                                'daysDifference': daysDifference,
                              }
                          ),
                        ),
                      );
                    },
                    child: Card(
                      margin: const EdgeInsets.all(3),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: color, width: 2),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Stack(
                        children: [
                          ListTile(
                            leading: SizedBox(
                              width: 60.0,
                              height: 60.0,
                              child: Image.network(_products[index]["image"]),
                            ),
                            title: Text(_products[index]["name"]),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Quantité : ${_products[index]["quantity"].toString()}"),
                                Text("DLC : $dlc"),
                              ],
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: ClipPath(
                              child: Container(
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: color, width: 65),
                                  ),
                                ),
                              ),
                              clipper: ShapeBorderClipper(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 10,
                            top: 22,
                            child: Text(
                              "${daysDifference} j",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
                : Container(),
          ],
        ),
      ),
    );
  }
}


  /// Section Widget
PreferredSizeWidget _buildAppBar(BuildContext context) {
  return CustomAppBar(
    title: AppbarSubtitleOne(
      text: "Vos Produits".tr,
      margin: EdgeInsets.only(left: 22.h),
    ),
    actions: [
      SizedBox(
        height: 45.h,
        width: 45.h,
        child: Padding(
          padding: EdgeInsets.only(right: 10.h),
          child: TextButton(
            onPressed: () {
              // Navigate to your desired page here
              //Navigator.push(
                //context,
                //MaterialPageRoute(builder: (context) => add_product_page()),
              //);
            },
            child: Icon(
              Icons.add,
              color: appTheme.green500,
              size: 30.h,
            ),
            style: TextButton.styleFrom(
              padding: EdgeInsets.only(right: 0),
              backgroundColor: Colors.white,
              shape: CircleBorder(),
            ),
          ),
        ),
      ),
    ],
    styleType: Style.bgFill,
  );
}




