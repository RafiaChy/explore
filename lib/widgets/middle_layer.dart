import 'package:explore/config/colors.dart';
import 'package:explore/config/text.dart';
import 'package:flutter/material.dart';

class MiddleLayer extends StatelessWidget {
  const MiddleLayer({
    super.key,
    required this.cardTexts,
  });

  final List<String> cardTexts;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5,
      runSpacing: 5,
      children: [
        for (int i = 0; i < cardTexts.length; i++)
           Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
                   color: softPurple,
            ),
            height: 40,
              padding: const EdgeInsets.all(8),
         
              child: Flex(
                mainAxisSize: MainAxisSize.min,
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'api data',
                    style: Theme.of(context)
                        .textTheme
                        .cardText
                        .copyWith(color: darkPurple),
                  ),
                  const Icon(
                    Icons.star_rate_rounded,
                    color: orangeColor,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '4.5',
                          style: Theme.of(context)
                              .textTheme
                              .rateText
                              .copyWith(color: darkPurple),
                        ),
                        TextSpan(
                          text: '(15)',
                          style: Theme.of(context)
                              .textTheme
                              .rateText
                              .copyWith(color: orangeColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          
      ],
    );
  }
}
