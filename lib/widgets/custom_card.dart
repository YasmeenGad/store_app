import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/update_product.dart';

class CustomCard extends StatelessWidget {
  CustomCard({required this.product});
  ProductModel product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, UpdateProduct.routeName,
            arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Card(
            elevation: 7,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(16),
                  vertical: ScreenUtil().setHeight(16)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title!.substring(0, 8),
                    style: TextStyle(fontSize: 18.sp, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${product.price.toString()}",
                        style: TextStyle(
                          fontSize: 18.sp,
                        ),
                      ),
                      Icon(FontAwesomeIcons.solidHeart, color: Colors.red)
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: Get.width / 6,
            bottom: 75.h,
            child: Image.network(product.image!, height: 105.h, width: 100.w),
          ),
        ],
      ),
    );
  }
}
