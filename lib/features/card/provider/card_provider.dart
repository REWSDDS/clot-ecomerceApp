import 'package:alfa/core/constants/color/color_const.dart';
import 'package:alfa/core/model/cloth_model.dart';
import 'package:alfa/core/model/cupon_model.dart';
import 'package:alfa/core/widgets/custom_snack_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CardProvider extends ChangeNotifier {
  // ? Savatga qoshilgan maxsulotlar uchun
  List<ClothModel> cardList = [];
  // ? Maxsulotlar uchun obshiy qiymat
  double totalAmount = 0.0;

  double afterCupon = 0.0;

  bool isCuponTrue = false;

  String userCupon = '';

  int discount = 0;

  double shippinCost = 5.0;

  // * Cupons

  List<CuponModel> cupons = [
    CuponModel(code: "CLOT24", discount: 20),
    CuponModel(code: "2003VORZAKON", discount: 40),
    CuponModel(code: "CHEGIRMA", discount: 5),
    CuponModel(code: 'UA34L', discount: 50)
  ];

  void checkCupon(String inputCupon, BuildContext context) {
    bool isRight = false;
    if (cardList.isEmpty) {
      showCustomSnackBar(
          context: context,
          message: 'Savat bo\'sh !',
          backgroundColor: ColorConst.red);
      return;
    }

    for (var i = 0; i < cupons.length; i++) {
      if (cupons[i].code == inputCupon) {
        // Calculate the discount amount
        double discountAmount = (totalAmount + 5 + (totalAmount * 0.12)) *
            (cupons[i].discount / 100);

        // Subtract the discount from the total amount
        afterCupon = (totalAmount + 5 + (totalAmount * 0.12)) - discountAmount;

        isRight = true;
        userCupon = inputCupon;
        discount = cupons[i].discount;
        break;
      } else {
        discount = 0;
        userCupon = '';
        isRight = false;
      }
    }

    isCuponTrue = isRight;
    notifyListeners();

    if (isRight) {
      showCustomSnackBar(
          context: context,
          message: 'Cupon is correct !',
          backgroundColor: ColorConst.green);
    } else {
      showCustomSnackBar(
          context: context,
          message: 'Cupon is incorrect !',
          backgroundColor: ColorConst.red);
    }
  }

  void addToCard(ClothModel model, {required int amount}) {
    if (amount == 1) {
      cardList.add(model);
    } else {
      for (var i = 0; i < amount; i++) {
        cardList.add(model);
      }
    }
    notifyListeners();
  }

  void removeFromCard(ClothModel model) {
    cardList.remove(model);
    notifyListeners();
  }

  void removeAll() {
    isCuponTrue = false;
    cardList.clear();
    notifyListeners();
  }

  void updateTotalAmount() {
    totalAmount = cardList.fold(0.0, (sum, model) => sum + model.price);
    notifyListeners();
  }
}
