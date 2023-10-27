import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/screens/home.dart';

void main(List<String> args) {
  runApp(StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Home.routeName,
      getPages: [GetPage(name: Home.routeName, page: () => Home())],
    );
  }
}
