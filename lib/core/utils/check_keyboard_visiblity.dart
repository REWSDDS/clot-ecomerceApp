import 'package:flutter/cupertino.dart';

bool checkKeyBoardVisibilty(BuildContext context){
  return MediaQuery.of(context).viewInsets.bottom != 0 ? true : false;
}