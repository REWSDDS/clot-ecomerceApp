import 'package:alfa/core/constants/color/color_const.dart';
import 'package:alfa/core/model/cloth_model.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  List<Sizes> sizes = [Sizes.S, Sizes.M, Sizes.L, Sizes.X, Sizes.XL, Sizes.XXL];

  List<Map<String, Color>> colors = [
    {'Orange': ColorConst.orange},
    {'Black': ColorConst.black},
    {'Red': ColorConst.red},
    {'Yellow': ColorConst.yellow},
    {'Blue': ColorConst.blue},
  ];

  // ! Tanlangan kiyim uchun razmer va rang
  ClothSize? clothSize;
  String? colorName;
  int? colorCode;

  void tanlaRazmer(ClothSize razmer) {
    if (razmer == clothSize) {
      clothSize = null;
    } else {
      clothSize = razmer;
    }
    print('TANLANGAN RAZMER $razmer');
    notifyListeners();
  }

  void tablaRang(String name, int code) {
    if (colorName == name) {
      colorName = null;
      colorCode = null;
    } else {
      colorName = name;
      colorCode = code;
    }
    print('TANLANGAN rang $colorName');
    notifyListeners();
  }

  void getProductPrice(int productPrice) {
    price = productPrice;
  }

  void setAllValuesToDefault() {
    sizes = [Sizes.S, Sizes.M, Sizes.L, Sizes.X, Sizes.XL, Sizes.XXL];
    colors = [
      {'Orange': ColorConst.orange},
      {'Black': ColorConst.black},
      {'Red': ColorConst.red},
      {'Yellow': ColorConst.yellow},
      {'Blue': ColorConst.blue},
    ];
    price = 148;
    quantity = 1;
    clothSize = null;
    colorName = null;
    colorCode = null;
  }

  final String title = "Men's Harrington Jacket";
  num price = 148;
  int quantity = 1;

  void decrement() {
    if (quantity > 1) {
      quantity--;
      notifyListeners();
    }
  }

  void increment() {
    quantity++;
    notifyListeners();
  }
}

enum Sizes { S, M, L, X, XL, XXL }
