import 'package:flutter/widgets.dart';

extension SizeBoxExtension on num {
  SizedBox get toHeight {
    return SizedBox(
      width: toDouble(),
      height: toDouble(),
    );
  }

  SizedBox toWidth(double height) {
    return SizedBox(
      width: toDouble(),
      height: height,
    );
  }
}
