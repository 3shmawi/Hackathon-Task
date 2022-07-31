import 'package:another_xlider/another_xlider.dart';
import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_gauges/gauges.dart';

class DefaultRadialGauge extends StatelessWidget {
  final double value;
  final bool state;
  final String hint;
  final double last;

  const DefaultRadialGauge({
    Key? key,
    this.last = 1000,
    required this.hint,
    this.state = false,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(axes: <RadialAxis>[
      RadialAxis(minimum: 0, maximum: last, ranges: <GaugeRange>[
        GaugeRange(
            startValue: 0,
            endValue: 30,
            color: Colors.white12,
            startWidth: 10,
            endWidth: 10),
        GaugeRange(
            startValue: 30,
            endValue: 70,
            color: Colors.orange,
            startWidth: 10,
            endWidth: 10),
        GaugeRange(
            startValue: 70,
            endValue: 100,
            color: Colors.red,
            startWidth: 10,
            endWidth: 10),
      ], pointers: <GaugePointer>[
        NeedlePointer(value: value)
      ], annotations: <GaugeAnnotation>[
        GaugeAnnotation(
            widget: Text('$value $hint',
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            angle: 90,
            positionFactor: 0.5)
      ])
    ]);
  }
}

class DefaultCardSlider extends StatelessWidget {
  final String text;
  final bool state;
  final double value;
  final Function(int handlerIndex, dynamic lowerValue, dynamic upperValue)?
      onDragging;

  const DefaultCardSlider(
      {required this.text,
      required this.value,
      required this.state,
      required this.onDragging,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 20,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                text,
                style:
                    const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    height: 300,
                    margin: const EdgeInsets.all(10),
                    child: SfLinearGauge(
                        interval: 20,
                        minorTicksPerInterval: 4,
                        minimum: 0.0,
                        maximum: 100.0,
                        orientation: LinearGaugeOrientation.vertical,
                        majorTickStyle: const LinearTickStyle(length: 20),
                        axisLabelStyle: const TextStyle(
                            fontSize: 12.0, color: Colors.black),
                        axisTrackStyle: const LinearAxisTrackStyle(
                            color: Colors.cyan,
                            edgeStyle: LinearEdgeStyle.bothFlat,
                            thickness: 15.0,
                            borderColor: Colors.grey)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 45.0),
                    child: SizedBox(
                      height: 320,
                      child: FlutterSlider(
                        maximumDistance: 60,
                        axis: Axis.vertical,
                        rtl: true,
                        //disabled: state,
                        onDragging: onDragging,
                        values: [value],
                        max: 100,
                        min: 0,
                      ),
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

class DefaultButton extends StatelessWidget {
  final Function()? onTap;
  final bool state;

  const DefaultButton({required this.onTap, required this.state, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastLinearToSlowEaseIn,
        height: state ? 64 : 67,
        width: state ? 190 : 200,
        decoration: BoxDecoration(
          color: state ? const Color(0xffB23F3F) : const Color(0xffFF4E4E),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(state ? 0 : 0.3),
              blurRadius: state ? 0 : 10,
              offset: const Offset(0, 7),
            ),
          ],
        ),
        child: Center(
          child: Text(
            state ? 'OFF' : 'ON',
            style: TextStyle(
              color: state
                  ? Colors.white.withOpacity(0.5)
                  : Colors.white.withOpacity(0.9),
              fontWeight: FontWeight.w600,
              fontSize: 19,
            ),
          ),
        ),
      ),
    );
  }
}
