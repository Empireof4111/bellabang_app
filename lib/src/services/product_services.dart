// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:bella_banga/error_handling.dart';
import 'package:bella_banga/src/model/categoryModel.dart';
import 'package:bella_banga/src/model/productModel.dart';
import 'package:bella_banga/src/utility.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductServices{

//FETCHING ALL PRODUCT
Future<List<Product>> fetchAllUserProducts(BuildContext context, int page, int size) async {
    List<Product> userProductList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('https://service.phopis.com/bellabanga/api/product/get_all?page=$page&size=$size'), 
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      });

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            for (int i = 0; i < jsonDecode(res.body)['payload']['content'].length; i++) {
              userProductList.add(
                Product.fromJson(
                  jsonEncode(
                    jsonDecode(res.body)['payload']['content'][i],
                  ),
                ),
              );
            }
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return userProductList;
  }


//FETCHING ALL CATEGORY
Future<List<CategoryModel>> fetchAllCategory(BuildContext context) async {
    List<CategoryModel> productCategoryList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('https://service.phopis.com/bellabanga/api/category/get_all'), 
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      });
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            for (int i = 0; i < jsonDecode(res.body)['payload'].length; i++) {
              productCategoryList.add(
                CategoryModel.fromJson(
                  jsonEncode(
                    jsonDecode(res.body)['payload'][i],
                  ),
                ),
              );
            }
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return productCategoryList;
  }


//FETCHING CATEGORY BY ID

Future<List<CategoryModel>> fetchProductCategoryById(BuildContext context, int id) async {
    List<CategoryModel> productCategoryById = [];
    try {
      http.Response res =
          await http.get(Uri.parse('https://service.phopis.com/bellabanga/api/category/get_by_id/$id'), 
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      });
      print(jsonDecode(res.body)['payload']['category']);
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
              productCategoryById.add(
                CategoryModel.fromJson(
                  jsonEncode(
                    jsonDecode(res.body)['payload'],
                  ),
                ),
              );
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return productCategoryById;
  }


}