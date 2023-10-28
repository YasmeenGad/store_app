import 'dart:convert';

import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';
import 'package:http/http.dart';

class AllProductsService {
  Future<List<ProductModel>> getAllProducts() async {
    Response response =
        await Api().get(url: "https://fakestoreapi.com/products");

    List<dynamic> data = jsonDecode(response.body);
    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      ProductModel product = ProductModel.fromJson(data[i]);
      productsList.add(product);
      // productsList.add(data[i]);
    }
    return productsList;
  }
}
