import 'package:explore/config/colors.dart';
import 'package:explore/config/text.dart';
import 'package:flutter/material.dart';

class CustomisedTile extends StatelessWidget {
  const CustomisedTile({
    super.key,
    this.isSelected = false,
    required this.cardTexts,
  });

  final bool isSelected;
  final String cardTexts;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(top: 20, left: 2, right: 2),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        color: isSelected == false ? whiteColor : purpleColor,
        border:
            Border.all(color: isSelected == false ? purpleColor : whiteColor),
      ),
      child: Center(
        child: Text(
          cardTexts,
          style: Theme.of(context).textTheme.tileText.copyWith(
                color: isSelected == true ? whiteColor : purpleColor,
              ),
        ),
      ),
    );
  }
}
