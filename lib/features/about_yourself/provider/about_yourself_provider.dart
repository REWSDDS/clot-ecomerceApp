import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AboutYourselfProvider extends ChangeNotifier {
  PickedGender pickedGenderWomen = PickedGender.none;
  PickedGender pickedGenderMen = PickedGender.none;

  String age = 'Age range';

  List<String> itemValue = [
    '0-7',
    '8-14',
    '15-19',
    '20-24',
    '25-29',
    '30-34',
    '35-39',
    '40-44',
    '45-49',
    '50-54',
    '55-59',
    '60-64',
    '65-69',
    '70+',
    'Age range'
  ];

  void setPickedGenderWomen(PickedGender gender) {
    pickedGenderWomen = gender;
    notifyListeners();
  }

  void setPickedGenderMen(PickedGender gender) {
    pickedGenderMen = gender;
    notifyListeners();
  }

  void pickAge(String value) {
    age = value;
    notifyListeners();
  }
}

enum PickedGender { men, women, none }
