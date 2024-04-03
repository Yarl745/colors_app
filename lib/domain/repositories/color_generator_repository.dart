import 'package:colors_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

/// Defines an interface for a repository that can generate сolors.
abstract class ColorGeneratorRepository {
  /// Generates a random color and handles potential errors.
  /// Returns either a Failure or a generated Color.
  Either<Failure, Color> generateRandomColor();
}
