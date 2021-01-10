import 'package:BMI/constants.dart';
import 'package:flutter/material.dart';

enum Gender { male, female }

//This class is for Male and Female Card ,,, para ni sa
// makitan kung asa ang active na card
class StateCardColour extends ChangeNotifier {
  Color _currentMaleColour = kActiveCardColour;
  Color _currentFemaleColour = kInActiveCardColour;

  Color get maleColour => _currentMaleColour;
  Color get femaleColour => _currentFemaleColour;

  //font and text color
  Color _currentFontMaleColour = Colors.white;
  Color _currentFontFemaleColour = kInActiveFontCardColour;

  Color get fontMaleColour => _currentFontMaleColour;
  Color get fontFemaleColour => _currentFontFemaleColour;

  void setActiveColour(Gender gender) {
    if (gender == Gender.male) {
      this._currentMaleColour = kActiveCardColour;
      this._currentFontMaleColour = Colors.white;
    } else {
      this._currentMaleColour = kInActiveCardColour;
      this._currentFontMaleColour = kInActiveFontCardColour;
    }

    if (gender == Gender.female) {
      this._currentFemaleColour = kActiveCardColour;
      this._currentFontFemaleColour = Colors.white;
    } else {
      this._currentFemaleColour = kInActiveCardColour;
      this._currentFontFemaleColour = kInActiveFontCardColour;
    }
    notifyListeners();
  }
}
