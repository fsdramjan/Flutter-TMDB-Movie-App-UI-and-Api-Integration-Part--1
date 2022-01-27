import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_api/src/configs/appTheme.dart';
import 'pages/homePage.dart';

class App extends StatelessWidget {
  const App({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      smartManagement: SmartManagement.onlyBuilder,
      theme: AppTheme.appTheme,
      home:HomePage(),

    );
  }
}