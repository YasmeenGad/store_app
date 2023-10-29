import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/service/update.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateProduct extends StatefulWidget {
  UpdateProduct({super.key});
  static const String routeName = "/updateProduct";

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  String? desc, image, productName, price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)?.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text("Update Product",
                  style: TextStyle(color: Colors.black))),
          body: Padding(
            padding: EdgeInsets.only(
                top: 16.h, left: 16.w, bottom: 16.h, right: 16.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 150.h,
                  ),
                  CustomTextField(
                    onChange: (data) {
                      productName = data;
                    },
                    hintText: "Product Name",
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextField(
                    onChange: (data) {
                      desc = data;
                    },
                    hintText: "Description",
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextField(
                    onChange: (data) {
                      price = data;
                    },
                    textInputType: TextInputType.number,
                    hintText: "Price",
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextField(
                    onChange: (data) {
                      image = data;
                    },
                    hintText: "Image",
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomButton(
                      txt: "Save Changes",
                      ontap: () async {
                        isLoading = true;
                        setState(() {});
                        try {
                          await updateProduct(product);
                        } catch (e) {
                          throw Exception('threr is an exception $e');
                        }
                        isLoading = false;
                        setState(() {});
                      })
                ],
              ),
            ),
          )),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
        id: product.id!,
        title: productName == null ? product.title! : productName!,
        price: price == null ? product.price!.toString() : price!,
        desc: desc == null ? product.description! : desc!,
        image: image == null ? product.image! : image!,
        category: product.caregory!);
  }
}
