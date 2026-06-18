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


  Future<bool> deleteProduct(String productID) async {
    isLoding = true;
    final response = await http.get(Uri.parse(Urls.deleteProduct(productID)));
    print(response.body);
    isLoding = false;
    if(response.statusCode == 200){

     return true;
    }else{
      return false;
    }
  }


  Future<bool> createProducts(Data data) async {
    isLoding = true;


    final response = await http.post(Uri.parse(Urls.createProduct),

    headers: {
      'Content-Type' : 'application/json'
    },

    body: jsonEncode({

        "ProductName": data.productName,
        "ProductCode": DateTime.now().microsecondsSinceEpoch,
        "Img": data.img,
        "Qty": data.qty,
        "UnitPrice": data.unitPrice,
        "TotalPrice": data.totalPrice

    })
    );



    isLoding = false;
    print(response.body);
    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }

}