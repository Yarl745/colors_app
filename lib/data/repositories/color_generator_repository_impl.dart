import 'dart:math';

import 'package:colors_app/core/error/failure.dart';
import 'package:colors_app/domain/repositories/color_generator_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

/// An implementation of the [ColorGeneratorRepository].
class ColorGeneratorRepositoryImpl implements ColorGeneratorRepository {
  static const _maxRGBColorValue = 255;

  final _randomGenerator = Random();

  /// Generates a random color using RGB values.
  /// Returns the generated color or a Failure in case of an error.
  @override
  Either<Failure, Color> generateRandomColor() {
    try {
      final redValue = _randomGenerator.nextInt(_maxRGBColorValue + 1);
      final greenValue = _randomGenerator.nextInt(_maxRGBColorValue + 1);
      final blueValue = _randomGenerator.nextInt(_maxRGBColorValue + 1);

      final generatedColor = Color.fromRGBO(redValue, greenValue, blueValue, 1);

      return right(generatedColor);
    } catch (error) {
      return left(const Failure());
    }
  }
}
