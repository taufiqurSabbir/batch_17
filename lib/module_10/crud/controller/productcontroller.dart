import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/productmodel.dart';
import '../utils/urls.dart';

class ProductController {
  List<Data>products = [];
  bool isLoding = false;
  
  Future fetchProducts() async {
    isLoding = true;
    final response = await http.get(Uri.parse(Urls.readProduct));
    isLoding = false;
    if(response.statusCode == 200){

      final data = jsonDecode(response.body);

      ProductModel model = ProductModel.fromJson(data);
      products = model.data ?? [];
    }
  }
}