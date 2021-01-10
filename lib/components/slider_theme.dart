import 'package:BMI/components/slider_card.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../constants.dart';

class SliderThemeOverride extends StatelessWidget {
  const SliderThemeOverride({
    Key key,
    @required this.provider,
  }) : super(key: key);

  final Provider provider;
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
        data: SliderTheme.of(context).copyWith(
          activeTrackColor: Colors.white,
          thumbColor: kPinkColor,
          overlayColor: Color(0x29EB1555),
          thumbShape: RoundSliderThumbShape(
            enabledThumbRadius: 15.0,
          ),
          overlayShape: RoundSliderOverlayShape(
            overlayRadius: 30.0,
          ),
        ),
        child: SliderCard(provider));
  }
}
