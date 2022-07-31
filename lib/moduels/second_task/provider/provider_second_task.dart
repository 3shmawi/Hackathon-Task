import 'dart:math';

import 'package:flutter/material.dart';

class SecondTaskProvider extends ChangeNotifier {
  //*point one
  double valueDXPosition = 0;

  void changeValueDXPosition(double value) {
    valueDXPosition = value;
    notifyListeners();
  }

  double valueDYPosition = 0;

  void changeValueDYPosition(double value) {
    valueDYPosition = value;
    notifyListeners();
  }

  double timeOne = 0;

  void getTimeOne(double value) {
    timeOne = value;
    notifyListeners();
  }

//* point two

  double valueDXPositionTwo = 0;

  void changeValueDXPositionTwo(double value) {
    valueDXPositionTwo = value;
    notifyListeners();
  }

  double valueDYPositionTwo = 0;

  void changeValueDYPositionTwo(double value) {
    valueDYPositionTwo = value;
    notifyListeners();
  }//* point three

  double valueDXPositionThree = 0;

  void changeValueDXPositionThree(double value) {
    valueDXPositionThree = value;
    notifyListeners();
  }

  double valueDYPositionThree = 0;

  void changeValueDYPositionThree(double value) {
    valueDYPositionThree = value;
    notifyListeners();
  }

  double timeTwo = 0;

  void getTimeTwo(double value) {
    timeTwo = value;
    timeTwo += 0.00000001;
    notifyListeners();
  }

  double speed = 0;
  double time = 0;
  double distance = 0;
  double accuration = 0;

  void getSpeed() {
    time = (timeOne - timeTwo).abs();
    distance = sqrt(pow((valueDXPositionTwo - valueDYPosition), 2) +
        pow(valueDYPositionTwo - valueDYPosition, 2));

    speed = distance / (time * 1000000);
    accuration = speed / (time * 1000000);
    print(time);
    print(distance);
    print(speed);
    notifyListeners();
  }
}
