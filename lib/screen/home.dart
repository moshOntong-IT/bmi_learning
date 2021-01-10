import 'package:BMI/components/bottom_card.dart';
import 'package:BMI/components/box_card.dart';
import 'package:BMI/components/calculate_button.dart';
import 'package:BMI/components/icon_content.dart';
import 'package:BMI/components/slider_theme.dart';
import 'package:BMI/constants.dart';
import 'package:BMI/screen/result/bmi_solution.dart';
import 'package:BMI/screen/result/result_page.dart';
import 'package:BMI/services/person_info.dart';
import 'package:BMI/services/state_card_colour.dart';
import 'package:flutter/material.dart';
//import this for hook provider
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
//
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final _activeCardProvider =
    ChangeNotifierProvider<StateCardColour>((ref) => StateCardColour());
final _personInfoProvider = Provider<PersonInfo>((ref) => PersonInfo());

class HomeScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _activeCardConsumer = useProvider(_activeCardProvider);
    final _personInfoConsumer = useProvider(_personInfoProvider);
    final size = MediaQuery.of(context).size;
    // Gender gender = Gender.male;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: BoxCard(
                  tap: () {
                    context
                        .read(_activeCardProvider)
                        .setActiveColour(Gender.male);
                    // _activeCardConsumer.setActiveColour(Gender.male);
                  },
                  colour: _activeCardConsumer.maleColour,
                  cardChild: IconContent(
                    size: size,
                    title: 'MALE',
                    icon: FontAwesomeIcons.mars,
                    fontColour: _activeCardConsumer.fontMaleColour,
                  ),
                ),
              ),
              Expanded(
                child: BoxCard(
                  tap: () {
                    context
                        .read(_activeCardProvider)
                        .setActiveColour(Gender.female);
                    // _activeCardConsumer.setActiveColour(Gender.female);
                  },
                  colour: _activeCardConsumer.femaleColour,
                  cardChild: IconContent(
                    size: size,
                    title: 'FEMALE',
                    icon: FontAwesomeIcons.venus,
                    fontColour: _activeCardConsumer.fontFemaleColour,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: BoxCard(
            colour: kActiveCardColour,
            //kaning area kay para kuhaon ang value sa slider by help of Consumer
            cardChild: SliderThemeOverride(provider: _personInfoProvider),
          ),
          // SliderCard(sliderValue: _slideConsumer),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: BoxCard(
                  colour: kActiveCardColour,
                  cardChild: ValueListenableBuilder(
                    valueListenable: _personInfoConsumer.weight,
                    builder: (context, _value, _) => BottomCard(
                      size: size,
                      label: 'WEIGHT',
                      value: _personInfoConsumer.weight.value,
                      onAddPressed: () {
                        context.read(_personInfoProvider).addWeight();
                      },
                      onMinusPressed: () {
                        context.read(_personInfoProvider).minusWeight();
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                child: BoxCard(
                  colour: kActiveCardColour,
                  cardChild: ValueListenableBuilder(
                    valueListenable: _personInfoConsumer.age,
                    builder: (context, _value, _) => BottomCard(
                      size: size,
                      label: 'AGE',
                      value: _personInfoConsumer.age.value,
                      onAddPressed: () {
                        context.read(_personInfoProvider).addAge();
                      },
                      onMinusPressed: () {
                        context.read(_personInfoProvider).addAge();
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        CalculateButton(
          label: 'CALCULATE',
          height: size.height * 0.1,
          onTap: () {
            BmiSolution calculate = BmiSolution(
                height: _personInfoConsumer.height.value,
                weight: _personInfoConsumer.weight.value);
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmi: calculate.calculateBMI(),
                    result: calculate.getResult(),
                    advice: calculate.getAdvices(),
                  ),
                ));
          },
        ),
      ],
    );
  }
}
