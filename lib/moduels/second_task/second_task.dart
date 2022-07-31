import 'package:controller/moduels/second_task/provider/provider_second_task.dart';
import 'package:controller/shared/component/components.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class SecondTask extends StatelessWidget {
  const SecondTask({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<SecondTaskProvider>(context);
    var function = Provider.of<SecondTaskProvider>(context, listen: false);
    return MouseRegion(
      onHover: (event) {
        // another point
        function.changeValueDXPositionThree(event.localPosition.dx);
        function.changeValueDYPositionThree(event.localPosition.dy);
      },
      child: GestureDetector(
        onPanUpdate: (event) {
          //second point
          function.getTimeTwo(DateTime.now().microsecond.toDouble());
          function.changeValueDXPositionTwo(event.localPosition.dx);
          function.changeValueDYPositionTwo(event.localPosition.dy);
          function.getSpeed();
        },
        onPanStart: (event) {
          //first point
          function.getTimeOne(DateTime.now().microsecond.toDouble());
          function.changeValueDXPosition(event.localPosition.dx);
          function.changeValueDYPosition(event.localPosition.dy);
        },
        child: Scaffold(
          body: ListView(
            shrinkWrap: true,
            children: [
              //getting first point
              Row(
                children: [
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: DefaultRadialGauge(
                      last: 1900,
                      hint: 'dx1',
                      value: state.valueDXPosition,
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: DefaultRadialGauge(
                      last: 1900,
                      hint: 'dy1',
                      value: state.valueDXPosition,
                    ),
                  ),
                ],
              ),
              //getting second point to get distance
              Row(
                children: [
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: DefaultRadialGauge(
                      last: 1900,
                      hint: 'dx2',
                      value: state.valueDXPositionTwo,
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: DefaultRadialGauge(
                      last: 1900,
                      hint: 'dy2',
                      value: state.valueDYPositionTwo,
                    ),
                  ),
                ],
              ),
              //when use button to get dx and dy without touching
              Row(
                children: [
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: DefaultRadialGauge(
                      last: 1900,
                      hint: 'dx3',
                      value: state.valueDXPositionThree,
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: DefaultRadialGauge(
                      last: 1900,
                      hint: 'dy3',
                      value: state.valueDYPositionThree,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: DefaultRadialGauge(
                      last: 100000,
                      hint: 'sp',
                      value: double.parse(state.speed.toStringAsFixed(2)),
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: DefaultRadialGauge(
                      last: 10000000,
                      hint: 'ac',
                      value: double.parse(state.accuration.toStringAsFixed(2)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
