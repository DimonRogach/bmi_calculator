import 'package:bmi_calculator/methods/calbmi.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screens/resultscreen.dart';
import '../components/iconsandlabels.dart';
import '../components/roundedbtn.dart';
import '../components/reuseablecard.dart';

enum GenderSelection {
  male,
  female,
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final inActiveColor = const Color(
    0xff1d1e33,
  );
  final activeColor = const Color(
    0x011d1e33,
  );
  late GenderSelection selection;
  int _height = 150;
  int _weight = 50;
  int _age = 25;

  @override
  void initState() {
    super.initState();
    selection = GenderSelection.male;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI Calculator',
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  ReuseableCard(
                    color: selection == GenderSelection.male
                        ? activeColor
                        : inActiveColor,
                    myChild: const IconWithLabel(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                    onpress: () {
                      setState(
                        () {
                          selection = GenderSelection.male;
                        },
                      );
                    },
                  ),
                  ReuseableCard(
                    color: selection == GenderSelection.male
                        ? inActiveColor
                        : activeColor,
                    myChild: const IconWithLabel(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                    onpress: () {
                      setState(
                        () {
                          selection = GenderSelection.female;
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            ReuseableCard(
              color: const Color(
                0xff1d1e33,
              ),
              myChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '$_height',
                        style: const TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'cm',
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 2.0,
                      activeTrackColor: Colors.white,
                      thumbColor: const Color(
                        0xffeb1555,
                      ),
                      overlayColor: const Color(
                        0x15eb1555,
                      ),
                      thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 15,
                      ),
                      overlayShape: const RoundSliderOverlayShape(
                        overlayRadius: 30,
                      ),
                    ),
                    child: Slider(
                      max: 220,
                      min: 120,
                      onChanged: (double newValue) {
                        setState(
                          () {
                            _height = newValue.toInt().round();
                          },
                        );
                      },
                      value: _height.toDouble(),
                    ),
                  ),
                ],
              ),
              onpress: () {},
            ),
            Expanded(
              child: Row(
                children: [
                  ReuseableCard(
                    color: const Color(
                      0xff1d1e33,
                    ),
                    myChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                        ),
                        Row(
                          textBaseline: TextBaseline.alphabetic,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Text(
                              '$_weight',
                              style: const TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              'kg',
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedBTN(
                              icon: FontAwesomeIcons.plus,
                              onpress: () {
                                setState(() {
                                  _weight++;
                                });
                              },
                              color: const Color(0xff0A0E21),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            RoundedBTN(
                              icon: FontAwesomeIcons.minus,
                              onpress: () {
                                setState(
                                  () {
                                    _weight--;
                                  },
                                );
                              },
                              color: const Color(0xff0A0E21),
                            ),
                          ],
                        )
                      ],
                    ),
                    onpress: () {},
                  ),
                  ReuseableCard(
                    color: const Color(
                      0xff1d1e33,
                    ),
                    myChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                        ),
                        Row(
                          textBaseline: TextBaseline.alphabetic,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Text(
                              '$_age',
                              style: const TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              'yr',
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedBTN(
                              icon: FontAwesomeIcons.plus,
                              onpress: () {
                                setState(
                                  () {
                                    _age++;
                                  },
                                );
                              },
                              color: const Color(0xff0A0E21),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            RoundedBTN(
                              icon: FontAwesomeIcons.minus,
                              onpress: () {
                                setState(
                                  () {
                                    _age--;
                                  },
                                );
                              },
                              color: const Color(0xff0A0E21),
                            ),
                          ],
                        )
                      ],
                    ),
                    onpress: () {},
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                CalculateBMI calculateBMI = CalculateBMI(
                  height: _height,
                  weight: _weight,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => ResultScreen(
                      bmi: calculateBMI.calculateBMI(),
                      result: calculateBMI.getResult(),
                      feedback: calculateBMI.feedBack(),
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(
                  double.infinity,
                  50,
                ),
              ),
              child: const Text(
                'CALCULATE',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
