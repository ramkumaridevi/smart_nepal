import 'package:flutter/widgets.dart';
import 'package:smart_nepal/core/utils/app_context.dart';

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

/// Two approaches for accessing screen dimensions:
/// 1. **Shorter Syntax (`0.5.screenWidth`)** - Compact but less readable.
/// 2. **More Readable (`ScreenExtension.width * 0.7`)** - Preferred for better clarity.
/// Uncomment the preferred approach based on usage.

// Extension for shorter syntax (0.5.screenWidth)
extension MediaQueryExtension on double {
  /// Multiplies the value by the full screen width.
  double get screenWidth =>
      this * MediaQuery.of(AppContext().context).size.width;

  /// Multiplies the value by the full screen height.
  double get screenHeight =>
      this * MediaQuery.of(AppContext().context).size.height;
}

/// Extension to get full screen width and height.
/// Preferred usage: `ScreenExtension.width * 0.7` for better readability.
// extension ScreenExtension on Object {
//   /// Returns the full screen width.
//   static double get width => MediaQuery.of(AppContext().context).size.width;
//   /// Returns the full screen height.
//   static double get height => MediaQuery.of(AppContext().context).size.height;
// }
