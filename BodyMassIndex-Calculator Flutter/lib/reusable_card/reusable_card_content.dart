import 'package:flutter/material.dart';
import '../constants/constants.dart';

class ReusableCardContent extends StatelessWidget {
  final String gender;
  final IconData fonts;
  const ReusableCardContent(
      {Key? key, required this.gender, required this.fonts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 15,
          child: Icon(
            fonts,
            size: kIconSize,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          flex: 7,
          child: Text(
            gender,
            style: kTextStyle,
          ),
        )
      ],
    );
  }
}
