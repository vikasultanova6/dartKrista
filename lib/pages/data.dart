import 'package:flutter/material.dart';
import 'package:online_shop/models/productModel.dart';
import 'package:online_shop/pages/API.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';

class DataDumper{
    static List<ProductModel> _inCart = List<ProductModel>(); 

    static List<ProductModel> getProducts(){
        List<ProductModel> models = List<ProductModel>();

        models.add(ProductModel(
            "Товар 1", 
            "Описание 1", 
            10, 
            "https://cdn.svyaznoy.ru/upload/iblock/84a/imac27_pf-screen.jpg"));
        models.add(ProductModel(
            "Товар 2", 
            "Описание 2", 
            15, 
            "https://cdn.svyaznoy.ru/upload/iblock/84a/imac27_pf-screen.jpg"));
        models.add(ProductModel(
            "Товар 3", 
            "Описание 3", 
            48, 
            "https://cdn.svyaznoy.ru/upload/iblock/84a/imac27_pf-screen.jpg"));
        
        return models;
    }

    static getProductsOnline() async {
        var data = await API.getProducts();
        if (data != null ) {
            List<dynamic> jsonData = json.decode(utf8.decode(data.bodyBytes));
            List<ProductModel> models = List<ProductModel>(); 

            models = jsonData.map((model) => ProductModel.fromJson(model)).toList()
                as List<ProductModel>;
            return models;
        }
        else {
            return getProducts();
        }
    }

    static List<ProductModel> getCart() {
        return _inCart;
    }

    static addCart (ProductModel model) {
        _inCart.add(model);
    }

    static removeCart (ProductModel model) {
        _inCart.remove(model);
    } 

    static getCartPrice () {
        var cost = 0.0;
        _inCart.forEach((element) {
            cost += element.cost;
        });
        return cost;
    }
}