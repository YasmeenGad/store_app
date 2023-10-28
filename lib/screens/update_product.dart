import 'package:flutter/material.dart';

class UpdateProduct extends StatelessWidget {
  const UpdateProduct({super.key});
  static const String routeName = "updateProduct";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title:
                Text("Update Product", style: TextStyle(color: Colors.black))));
  }
}
