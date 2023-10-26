import 'package:http/http.dart';
import 'dart:convert';

import 'package:store_app/helper/api.dart';

class AllCategoriesService {
  Future<List<dynamic>> getAllCategories() async {
    Response response =
        await Api().get(url: "https://fakestoreapi.com/products/categories");

    List<dynamic> data = jsonDecode(response.body);
    return data;
  }
}
