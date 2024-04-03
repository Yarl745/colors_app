import 'dart:math';

import 'package:colors_app/core/error/failure.dart';
import 'package:colors_app/domain/repositories/color_generator_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

/// An implementation of the [ColorGeneratorRepository].
class ColorGeneratorRepositoryImpl implements ColorGeneratorRepository {
  static const _maxRGBColorValue = 255;
  static const _luminanceThresholdValue = 0.5;

  final _randomGenerator = Random();
  var _generatedColor = Colors.black;
  var _contrastColor = Colors.white;

  /// Generates a random color using RGB values.
  /// Returns the generated color or a Failure in case of an error.
  @override
  Either<Failure, Color> generateRandomColor() {
    try {
      final redValue = _randomGenerator.nextInt(_maxRGBColorValue + 1);
      final greenValue = _randomGenerator.nextInt(_maxRGBColorValue + 1);
      final blueValue = _randomGenerator.nextInt(_maxRGBColorValue + 1);

      _generatedColor = Color.fromRGBO(redValue, greenValue, blueValue, 1);

      return right(_generatedColor);
    } catch (error) {
      return left(const Failure());
    }
  }

  /// Calculates and returns the contrast color for `_generatedColor`.
  /// Uses luminance to decide between black and white contrast color.
  /// On error, returns a Failure.
  @override
  Either<Failure, Color> getContrastColor() {
    try {
      // Calculate luminance of the generated color.
      final double luminance = (0.299 * _generatedColor.red +
              0.587 * _generatedColor.green +
              0.114 * _generatedColor.blue) /
          255;

      // Determine contrast color based on luminance threshold.
      _contrastColor =
          luminance > _luminanceThresholdValue ? Colors.black : Colors.white;

      return right(_contrastColor);
    } catch (error) {
      return left(const Failure());
    }
  }
}
