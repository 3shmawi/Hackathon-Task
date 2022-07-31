import 'package:flutter/material.dart';

class FirstTaskProvider extends ChangeNotifier {
  double indexCardOne = 0;

  void changeSliderValueCardOne(double value) {
    indexCardOne = value;
    notifyListeners();
  }

  double indexCardTwo = 0;

  void changeSliderValueCardTwo(double value) {
    indexCardTwo = value;
    notifyListeners();
  }

  bool isTappedOne = false;

  void changeIsTappedOne() {
    isTappedOne = !isTappedOne;
    notifyListeners();
  }

  bool isTappedTwo = false;

  void changeIsTappedTwo() {
    isTappedTwo = !isTappedTwo;
    notifyListeners();
  }

}
