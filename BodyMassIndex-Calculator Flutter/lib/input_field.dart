import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card/reusable_card.dart';
import 'reusable_card/reusable_card_content.dart';
import 'constants/constants.dart';
import 'results.dart';
import 'app_logic.dart';
import 'bottom_button/calculate_weight_button.dart';

enum Gender {
  male,
  female,
}

class InputField extends StatefulWidget {
  const InputField({Key? key}) : super(key: key);
  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  Gender? selectGender;
  int height = 170;
  int weight = 50;
  int age = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colours: selectGender == Gender.male
                        ? kActiveBoxColors
                        : kInActiveBoxColors,
                    cardItem: const ReusableCardContent(
                      gender: "MALE",
                      fonts: FontAwesomeIcons.mars,
                    ),
                    onPress: () {
                      setState(() {
                        selectGender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                    child: ReusableCard(
                  colours: selectGender == Gender.female
                      ? kActiveBoxColors
                      : kInActiveBoxColors,
                  cardItem: const ReusableCardContent(
                    gender: "FEMALE",
                    fonts: FontAwesomeIcons.venus,
                  ),
                  onPress: () {
                    setState(() {
                      selectGender = Gender.female;
                    });
                  },
                )),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colours: kActiveBoxColors,
              cardItem: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "HEIGHT",
                    style: kTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kTextNumberStyle,
                      ),
                      const SizedBox(
                        width: 3.0,
                      ),
                      const Text(
                        "cm",
                        style: kTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 14.0),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30.0),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.grey,
                      thumbColor: const Color(0xFFEB1555),
                      overlayColor: const Color(0x1fEB1555),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 230.0,
                      onChanged: (double value) {
                        setState(() {
                          height = value.toInt();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colours: kActiveBoxColors,
                    cardItem: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "WEIGHT",
                          style: kTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kTextNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconBtn(
                              iconInfo: FontAwesomeIcons.minus,
                              upDateWeight: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 15.0,
                            ),
                            RoundIconBtn(
                              iconInfo: FontAwesomeIcons.plus,
                              upDateWeight: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: ReusableCard(
                  colours: kActiveBoxColors,
                  cardItem: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "AGE",
                        style: kTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kTextNumberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconBtn(
                              iconInfo: FontAwesomeIcons.minus,
                              upDateWeight: () {
                                setState(() {
                                  if (age > 0) {
                                    age--;
                                  }
                                });
                              }),
                          const SizedBox(
                            width: 15.0,
                          ),
                          RoundIconBtn(
                              iconInfo: FontAwesomeIcons.plus,
                              upDateWeight: () {
                                setState(() {
                                  if (age >= 0) {
                                    age++;
                                  }
                                });
                              })
                        ],
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
          CalculateWeightButton(
              word: "CALCULATE",
              changeScreen: () {
                AppLogic appLogic = AppLogic(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            bmiResult: appLogic.calculateBmi(),
                            resultText: appLogic.printResult(),
                            resultMeaning: appLogic.interpretResult(),
                          )),
                );
              }),
        ],
      ),
    );
  }
}

class RoundIconBtn extends StatelessWidget {
  const RoundIconBtn(
      {Key? key, required this.iconInfo, required this.upDateWeight})
      : super(key: key);
  final IconData iconInfo;
  final VoidCallback upDateWeight;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        child: Icon(iconInfo),
        shape: const CircleBorder(),
        elevation: 7.0,
        fillColor: Colors.grey,
        constraints: const BoxConstraints.tightFor(
          width: 50.0,
          height: 50.0,
        ),
        onPressed: upDateWeight);
  }
}

//The key is use to know the state of your widget on the widget tree as they are moving around
// void genderColorChange({required Gender selectGender}) {
//   // selectGender == Gender.male && maleColor == inActiveBoxColors ? maleColor == activeBoxColors && femaleColor == inActiveBoxColors : maleColor = inActiveBoxColors
//   if (selectGender == Gender.male) {
//     if (maleColor == inActiveBoxColors) {
//       maleColor = activeBoxColors;
//       femaleColor = inActiveBoxColors;
//     } else {
//       maleColor = inActiveBoxColors;
//     }
//   } else {
//     if (femaleColor == inActiveBoxColors) {
//       femaleColor = activeBoxColors;
//       maleColor = inActiveBoxColors;
//     } else {
//       femaleColor = inActiveBoxColors;
//     }
//   }
// }
