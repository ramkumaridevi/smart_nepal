import 'package:flutter/material.dart';

// Font weights
class AppFontWeight {
  static const FontWeight thin = FontWeight.w100;
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight heavy = FontWeight.w900;
}

// Colors
class AppColors {
  static const Color primary = Color(0xFF135894);
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color blue = Color(0xFF2196F3);
  static const Color purple = Color(0xFFA25DEC);
  static const Color amountCard = Color(0xFF2A2A30);
  static const Color grey = Colors.grey;
  static const Color green = Colors.green;
  static const Color orange = Colors.deepOrange;
  static const Color teal = Colors.teal;
  static const Color lightBlue = Color(0xFFD6E9F7);
  static const Color lightOrange = Color(0xFFF8E1CE);
  static const Color expertCard = Color(0xFF1D1D2E);
  static const Color planCard = Color(0xFF16181F);
}

class AppSpacing {
  // Horizontal spacing
  static const SizedBox horizontalExtraSmall = SizedBox(width: 5.0);
  static const SizedBox horizontalSmall = SizedBox(width: 8.0);
  static const SizedBox horizontalMedium = SizedBox(width: 16.0);
  static const SizedBox horizontalLarge = SizedBox(width: 32.0);

  // Vertical spacing
  static const SizedBox verticalExtraSmall = SizedBox(height: 4.0);
  static const SizedBox verticalSmall = SizedBox(height: 8.0);
  static const SizedBox verticalMedium = SizedBox(height: 16.0);
  static const SizedBox verticalLarge = SizedBox(height: 32.0);

  // Dynamic spacing
  static SizedBox horizontal(double width) => SizedBox(width: width);
  static SizedBox vertical(double height) => SizedBox(height: height);
}
