import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'models/main_page_model.dart';
import 'models/mainpage_item_model.dart';
import 'provider/main_page_provider.dart';
import 'widgets/mainpage_item_widget.dart';
import 'dart:convert';

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
  @override
  void initState() {
    super.initState();
    _readJson();
  }

  List _products = []; // Initialisez _items avec une liste vide

  Future<void> _readJson() async {
    final String response = await rootBundle.loadString('assets/mock/products.json');
    final data = await json.decode(response);
      setState(() {
      _products = data["products"];
      });
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

            // Display the data loaded from sample.json
            _products.isNotEmpty
                ? Expanded(
              child: ListView.builder(
                itemCount: _products.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      //leading: Text(_products[index]["category"]),
                      leading: Image.network(
                        _products[index]["image"],
                        width: 70,
                        height: 70,
                      ),
                      title: Text(_products[index]["name"]),
                      subtitle: Column (
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:<Widget>[
                          Text("Quantité : ${_products[index]["quantity"].toString()}"),
                          Text("DLC : ${_products[index]["dlc"]}"),
                        ],
                      )
                    ),
                  );
                },
              ),
            )
                : Container()
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




