import 'package:explore/config/colors.dart';
import 'package:explore/config/text.dart';
import 'package:explore/modules/model/filter.dart';
import 'package:flutter/material.dart';

class TopLayer extends StatelessWidget {
  const TopLayer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final filterModel = Filter();
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 20,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              'https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
              fit: BoxFit.cover,
              height: 80,
              width: 80,
            ),
          ),
        ),
        Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Susanne Beich',
              style: Theme.of(context).textTheme.nameText,
            ),
            Flex(
              direction: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.star_rate_rounded,
                  color: orangeColor,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  child: Text(
                    '4.5',
                    style: Theme.of(context)
                        .textTheme
                        .rateText
                        .copyWith(color: darkPurple),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  child: Text(
                    '(15)',
                    style: Theme.of(context)
                        .textTheme
                        .rateText
                        .copyWith(color: orangeColor),
                  ),
                ),
              ],
            ),
            Flex(
              direction: Axis.horizontal,
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  color: darkPurple,
                ),
                SizedBox(
                  width: 130,
                  child: RichText(
                    overflow: TextOverflow.visible,
                    maxLines: 3,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Alsterkrugchaussee 92 86656 Bissingen',
                          style:
                              Theme.of(context).textTheme.locationText.copyWith(
                                    color: darkPurple,
                                  ),
                        ),
                        TextSpan(
                          text: ' ${filterModel.latitude}',
                          style:
                              Theme.of(context).textTheme.locationText.copyWith(
                                    color: greyColor,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 5,
              color: darkPurple,
            ),
          ),
          child: FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () {},
            elevation: 0,
            child: const Icon(
              Icons.mail_outlined,
              color: darkPurple,
            ),
          ),
        ),
      ],
    );
  }
}
