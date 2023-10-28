import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:store_app/screens/home.dart';
import 'package:store_app/screens/update_product.dart';

void main(List<String> args) {
  runApp(StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(400, 820),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: Home.routeName,
          getPages: [
            GetPage(name: Home.routeName, page: () => Home()),
            GetPage(name: UpdateProduct.routeName, page: () => UpdateProduct()),
          ],
        );
      },
    );
  }
}
