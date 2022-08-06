import 'package:explore/config/colors.dart';
import 'package:flutter/material.dart';

extension TextConfig on TextTheme {
  TextStyle get titleText {
    return const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: darkPurple,
    );
  }

  TextStyle get tileText {
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle get nameText {
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: darkPurple,
    );
  }

  TextStyle get rateText {
    return const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: darkPurple,
    );
  }

  TextStyle get buttonText {
    return const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: darkPurple,
    );
  }

  TextStyle get cardText {
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle get locationText {
    return const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
    );
  }
}
