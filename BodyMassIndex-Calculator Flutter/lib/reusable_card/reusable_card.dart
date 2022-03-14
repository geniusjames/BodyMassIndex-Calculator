import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colours;
  final Widget? cardItem;
  final VoidCallback? onPress;
  const ReusableCard(
      {Key? key, required this.colours, this.cardItem, this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: colours,
          borderRadius: BorderRadius.circular(10),
        ),
        child: cardItem,
      ),
    );
  }
}
