import 'package:colors_app/core/extensions/color_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ColorExt', () {
    test('should return white for a dark color', () {
      const color = Color(0xFF000080); // Navy blue
      expect(color.contrast, Colors.white);
    });

    test('should return black for a light color', () {
      const color = Color(0xFFFFD700); // Gold
      expect(color.contrast, Colors.black);
    });

    test(
        'should return black for a color slightly above the luminance '
        'threshold', () {
      // Assuming the threshold is 0.5, choose a color slightly above it
      const color = Color(0xFFBEBEBE); // A light gray
      expect(color.contrast, Colors.black);
    });

    test(
        'should return black for a color slightly below the luminance '
        'threshold', () {
      // Assuming the threshold is 0.5, choose a color slightly below it
      const color = Color(0xFF808080); // A medium gray
      expect(color.contrast, Colors.black);
    });

    test('should return white for black', () {
      const color = Color(0xFF000000); // Black
      expect(color.contrast, Colors.white);
    });

    test('should return black for white', () {
      const color = Color(0xFFFFFFFF); // White
      expect(color.contrast, Colors.black);
    });
  });
}
