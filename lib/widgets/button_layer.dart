import 'package:explore/config/colors.dart';
import 'package:explore/config/text.dart';
import 'package:flutter/material.dart';

class ButtonLayer extends StatelessWidget {
  const ButtonLayer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: purpleColor,
          ),
          onPressed: () {},
          child: SizedBox(
            width: 170,
            height: 50,
            child: Center(
              child: Text(
                'Request',
                style: Theme.of(context)
                    .textTheme
                    .buttonText
                    .copyWith(color: whiteColor),
              ),
            ),
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                side: BorderSide(color: purpleColor),
              ),
            ),
          ),
          onPressed: () {},
          child: SizedBox(
            width: 80,
            height: 50,
            child: Center(
              child: Text(
                'Profile',
                style: Theme.of(context)
                    .textTheme
                    .buttonText
                    .copyWith(color: purpleColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
