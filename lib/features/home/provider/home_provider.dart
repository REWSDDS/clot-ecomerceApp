import 'dart:math';

import 'package:alfa/core/model/category_model.dart';
import 'package:alfa/core/model/cloth_model.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  String avatarImage =
      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8YXZhdGFyfGVufDB8fDB8fHww';

  List<CategoryModel> categoires = [
    CategoryModel(name: 'Hoodies', image: 'assets/images/hoodies.png'),
    CategoryModel(name: 'Shorts', image: 'assets/images/shorts.png'),
    CategoryModel(name: 'Shoes', image: 'assets/images/shoes.png'),
    CategoryModel(name: 'Bags', image: 'assets/images/bag.png'),
    CategoryModel(name: 'Accessories', image: 'assets/images/accessories.png')
  ];

  // ! Hoodies
  List<ClothModel> hoodies = [
    ClothModel(
        image:
            'https://plus.unsplash.com/premium_photo-1673827311290-d435f481152e?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aG9vZGllfGVufDB8fDB8fHww',
        name: 'Ocean hoodie',
        price: 150,
        color: [
          0XFFFFFFFF,
          0XFF0000FF
        ],
        size: [
          ClothSize.m,
          ClothSize.s,
          ClothSize.xl,
        ],
        colorName: [
          'White',
          'Blue',
        ]),
    ClothModel(
        image:
            'https://plus.unsplash.com/premium_photo-1681493944219-44118cf7754d?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8aG9vZGllfGVufDB8fDB8fHww',
        name: 'Begie hoodie',
        price: 50,
        color: [
          0XFFeed9c4,
          0XFF000000,
        ],
        size: [
          ClothSize.xs,
          ClothSize.s,
          ClothSize.m,
        ],
        colorName: [
          'Begie',
          'Black'
        ]),
  ];

  // ! Shorts
  List<ClothModel> shorts = [
    ClothModel(
        image:
            'https://images.unsplash.com/photo-1591195853828-11db59a44f6b?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2hvcnRzJTIwY2xvdGh8ZW58MHx8MHx8fDA%3D',
        name: 'Blue short',
        price: 10,
        disCount: true,
        oldPrice: 15,
        color: [0XFFADD8E6],
        size: [ClothSize.xs],
        colorName: ['Blue light']),
    ClothModel(
        image:
            'https://images.unsplash.com/photo-1624378440070-950d99e25830?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8c2hvcnRzJTIwY2xvdGh8ZW58MHx8MHx8fDA%3D',
        name: 'Black short',
        price: 150,
        disCount: true,
        oldPrice: 200,
        color: [0XFFADD8E6],
        size: [ClothSize.xs],
        colorName: ['Blue light'])
  ];

  // ! Shoes
  List<ClothModel> shoes = [
    ClothModel(
        image:
            'https://images.unsplash.com/photo-1491553895911-0055eca6402d?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8c2hvZXN8ZW58MHx8MHx8fDA%3D',
        name: 'Nike Air Jordan',
        price: 200,
        colorName: ['White'],
        color: [0XFFFFFFFF],
        size: [ClothSize.xs, ClothSize.s, ClothSize.m, ClothSize.xl]),
    ClothModel(
        image:
            'https://images.unsplash.com/photo-1529810313688-44ea1c2d81d3?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8c2hvZXN8ZW58MHx8MHx8fDA%3D',
        name: 'NIke 360',
        price: 300,
        colorName: ['White', 'Green'],
        color: [0XFFFFFFFF, 0xff42C52F],
        size: [ClothSize.xs, ClothSize.s, ClothSize.m, ClothSize.xl]),
    ClothModel(
        image:
            'https://images.unsplash.com/photo-1525966222134-fcfa99b8ae77?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHNob2VzfGVufDB8fDB8fHww',
        name: 'Adidas',
        price: 90,
        disCount: true,
        oldPrice: 150,
        colorName: ['Red'],
        color: [0xffFA3636],
        size: [ClothSize.xs, ClothSize.s, ClothSize.m, ClothSize.xl]),
  ];

  List<ClothModel> topSelling = [];

  List<List<ClothModel>> all = [];

  // ! Hoodie [] Shorts [] ==> [[],[],[],[],[]]

  List<ClothModel> searchAll = [];

  void generateAllInfoInOneList() {
    all.add(hoodies);
    all.add(shorts);
    all.add(shoes);
    for (var i = 0; i < hoodies.length; i++) {
      searchAll.add(hoodies[i]);
    }
    for (var i = 0; i < shorts.length; i++) {
      searchAll.add(shorts[i]);
    }
  }

  // * All list

  void addToTopSelling() {
    topSelling.add(hoodies[Random().nextInt(hoodies.length)]);
    topSelling.add(shorts[Random().nextInt(shorts.length)]);
    topSelling.add(shoes[Random().nextInt(shoes.length)]);
  }
}
