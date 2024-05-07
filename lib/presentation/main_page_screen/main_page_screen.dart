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
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Kindacode.com',
        ),
      ),
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
                      leading: Text(_products[index]["category"]),
                      title: Text(_products[index]["name"]),
                      subtitle: Text(_products[index]["dlc"]),
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
        text: "lbl_votre_profil".tr,
        margin: EdgeInsets.only(left: 22.h),
      ),
      actions: [
        Container(
          margin: EdgeInsets.fromLTRB(16.h, 14.v, 16.h, 18.v),
          padding: EdgeInsets.symmetric(horizontal: 24.h),
          decoration: AppDecoration.fillPrimary.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder5,
          ),
          child: AppbarSubtitle(
            text: "lbl".tr,
          ),
        )
      ],
      styleType: Style.bgFill,
    );
  }


