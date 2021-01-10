import 'package:BMI/services/person_info.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../constants.dart';

class SliderCard extends HookWidget {
  final Provider<PersonInfo> _personInfoProvider;

  const SliderCard(this._personInfoProvider);
  @override
  Widget build(BuildContext context) {
    final _personInfoConsumer = useProvider<PersonInfo>(_personInfoProvider);
    return ValueListenableBuilder<int>(
      valueListenable: _personInfoConsumer.height,
      builder: (context, value, _) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'HEIGHT',
            style: kLabelStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            children: <Widget>[
              Text(
                '$value',
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                'cm',
                style: kLabelStyle,
              ),
            ],
          ),
          Slider(
            value: value.toDouble(),
            max: 220.0,
            // activeColor: kPinkColor,
            min: 120.0,
            inactiveColor: kInActiveFontCardColour,
            onChanged: (value) =>
                context.read(_personInfoProvider).setHeight(value.round()),
          ),
        ],
      ),
    );
  }
}
