import 'dart:convert';

import 'package:http/http.dart';
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class CategoriesService {
  Future<List<dynamic>> getCategoriesProducts(
      {required String categoryName}) async {
    Response response = await Api()
        .get(url: "https://fakestoreapi.com/products/category/$categoryName");

    List<dynamic> data = jsonDecode(response.body);
    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(data[i]);
    }
    return productsList;
  }
}
