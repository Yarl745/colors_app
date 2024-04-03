import 'package:flutter/material.dart';

/// Extension on [Color]
extension ColorExt on Color {
  static const _luminanceThresholdValue = 0.5;

  /// Calculates and returns a contrast color (black or white).
  Color get contrast {
    // Calculate luminance of the generated color.
    final luminance = (0.299 * red + 0.587 * green + 0.114 * blue) / 255;

    // Determine contrast color based on luminance threshold.
    return luminance > _luminanceThresholdValue ? Colors.black : Colors.white;
  }
}
