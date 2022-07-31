import 'package:controller/moduels/first_task/provider/provider_first_task.dart';
import 'package:controller/shared/component/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class FirstTaskScreen extends StatelessWidget {
  const FirstTaskScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<FirstTaskProvider>(context);
    var function = Provider.of<FirstTaskProvider>(context, listen: false);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildFirstColumn(state, function),
              const SizedBox(
                width: 20,
              ),
              buildSecondColumn(state, function),
              const SizedBox(
                width: 80,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Lottie.network(
                          width: 200,
                          height: 200,
                          'https://assets6.lottiefiles.com/packages/lf20_AlM0Lz.json',
                        ),
                        Lottie.network(
                          width: 200,
                          height: 200,
                          reverse: true,
                          'https://assets6.lottiefiles.com/packages/lf20_AlM0Lz.json',
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Lottie.network(
                          width: 100,
                          height: 100,
                          'https://assets1.lottiefiles.com/private_files/lf30_utzio8lv.json',
                        ),
                        Lottie.network(
                          width: 100,
                          height: 100,
                          reverse: true,
                          'https://assets1.lottiefiles.com/private_files/lf30_utzio8lv.json',
                        ),
                        Lottie.network(
                          width: 100,
                          height: 100,
                          'https://assets1.lottiefiles.com/private_files/lf30_utzio8lv.json',
                        ),
                        Lottie.network(
                          width: 100,
                          height: 100,
                          reverse: true,
                          'https://assets1.lottiefiles.com/private_files/lf30_utzio8lv.json',
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Lottie.network(
                          width: 100,
                          height: 100,
                          'https://assets5.lottiefiles.com/packages/lf20_9Rpr7C.json',
                        ),
                        Lottie.network(
                          width: 100,
                          height: 100,
                          reverse: true,
                          'https://assets5.lottiefiles.com/packages/lf20_9Rpr7C.json',
                        ),
                        Lottie.network(
                          width: 100,
                          height: 100,
                          'https://assets5.lottiefiles.com/packages/lf20_9Rpr7C.json',
                        ),
                        Lottie.network(
                          width: 100,
                          height: 100,
                          reverse: true,
                          'https://assets5.lottiefiles.com/packages/lf20_9Rpr7C.json',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column buildSecondColumn(
      FirstTaskProvider state, FirstTaskProvider function) {
    return Column(
      children: [
        DefaultRadialGauge(
            last: 100,
            hint: 'm',
            state: state.isTappedTwo,
            value: state.indexCardTwo),
        DefaultCardSlider(
          text: '    Level    ',
          value: state.indexCardTwo,
          state: state.isTappedTwo,
          onDragging: (handlerIndex, lowerValue, upperValue) {
            if (!state.isTappedTwo) {
              function.changeSliderValueCardTwo(lowerValue);
            }
          },
        ),
        const SizedBox(
          height: 40,
        ),
        DefaultButton(
          onTap: () {
            HapticFeedback.lightImpact();
            function.changeIsTappedTwo();
          },
          state: state.isTappedTwo,
        ),
      ],
    );
  }

  Column buildFirstColumn(FirstTaskProvider state, FirstTaskProvider function) {
    return Column(
      children: [
        DefaultRadialGauge(
            last: 100,
            hint: 'Psi',
            state: state.isTappedOne,
            value: state.indexCardOne),
        DefaultCardSlider(
          text: 'Pressure',
          value: state.indexCardOne,
          state: state.isTappedOne,
          onDragging: (handlerIndex, lowerValue, upperValue) {
            if (!state.isTappedOne) {
              function.changeSliderValueCardOne(lowerValue);
            }
          },
        ),
        const SizedBox(
          height: 40,
        ),
        DefaultButton(
            onTap: () {
              HapticFeedback.lightImpact();
              function.changeIsTappedOne();
            },
            state: state.isTappedOne),
      ],
    );
  }
}
