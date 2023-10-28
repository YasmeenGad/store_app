import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/service/get_all_products.dart';

import 'package:store_app/widgets/custom_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(FontAwesomeIcons.cartPlus, color: Colors.black))
        ],
        title: Text(
          "New Trend",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 70.h),
          child: FutureBuilder<List<ProductModel>>(
            future: AllProductsService().getAllProducts(),
            builder: (BuildContext context,
                AsyncSnapshot<List<ProductModel>> snapshot) {
              if (snapshot.hasData) {
                List<ProductModel> products = snapshot.data!;
                return GridView.builder(
                    itemCount: products.length,
                    clipBehavior: Clip.none,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.3,
                        crossAxisSpacing: 10.h,
                        mainAxisSpacing: 80.w),
                    itemBuilder: (context, index) {
                      return CustomCard(
                        product: products[index],
                      );
                    });
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )),
    );
  }
}
