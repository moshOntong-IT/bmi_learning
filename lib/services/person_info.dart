import 'package:BMI/constants.dart';
import 'package:BMI/services/state_card_colour.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PersonInfo {
  static final List<Color> _availableColor = <Color>[
    kActiveCardColour,
    kInActiveCardColour,
    Colors.white,
    kInActiveFontCardColour
  ];
  final ValueNotifier<int> _height = ValueNotifier<int>(180);
  final ValueNotifier<int> _weight = ValueNotifier<int>(60);
  final ValueNotifier<Gender> _gender = ValueNotifier<Gender>(Gender.male);
  final ValueNotifier<int> _age = ValueNotifier<int>(15);

//ValueNotifier for the male and female Card
  final ValueNotifier<Color> _currentMaleColour =
      ValueNotifier<Color>(_availableColor[0]);
  final ValueNotifier<Color> _currentFemaleColour =
      ValueNotifier<Color>(_availableColor[1]);
  final ValueNotifier<Color> _currentFontMaleColour =
      ValueNotifier<Color>(_availableColor[2]);
  final ValueNotifier<Color> _currentFontFemaleColour =
      ValueNotifier<Color>(_availableColor[3]);

  void setHeight(int value) {
    _height.value = value;
  }

  void addWeight() {
    _weight.value++;
  }

  void minusWeight() {
    _weight.value--;
  }

  void addAge() {
    _age.value++;
  }

  void minusAge() {
    _age.value--;
  }

  void setActiveColour(Gender gender) {
    _gender.value = gender;
    if (gender == Gender.male) {
      _currentMaleColour.value = _availableColor[0];
      _currentFontMaleColour.value = _availableColor[2];
    } else {
      _currentMaleColour.value = _availableColor[1];
      _currentFontMaleColour.value = _availableColor[3];
    }

    if (gender == Gender.female) {
      _currentFemaleColour.value = _availableColor[0];
      _currentFontFemaleColour.value = _availableColor[2];
    } else {
      _currentFemaleColour.value = _availableColor[1];
      _currentFontFemaleColour.value = _availableColor[3];
    }
  }

  ValueNotifier<int> get height => _height;
  ValueNotifier<int> get weight => _weight;
  ValueNotifier<Gender> get gender => _gender;
  ValueNotifier<Color> get maleColour => _currentMaleColour;
  ValueNotifier<Color> get femaleColour => _currentFemaleColour;
  ValueNotifier<Color> get fontMaleColour => _currentFontMaleColour;
  ValueNotifier<Color> get fontFemaleColour => _currentFontFemaleColour;
  ValueNotifier<int> get age => _age;
}
