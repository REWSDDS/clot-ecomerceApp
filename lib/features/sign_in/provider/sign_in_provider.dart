import 'package:alfa/core/constants/icons/icons_const.dart';
import 'package:flutter/cupertino.dart';

class SignInProvider extends ChangeNotifier {
  List<String> signInAppIcons = [
    IconsConst.apple,
    IconsConst.google,
    IconsConst.facebook
  ];

  List<String> signInAppTitles = ['Apple', 'Google', 'Facebook'];
}
