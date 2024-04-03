import 'package:colors_app/core/error/failure.dart';
import 'package:colors_app/data/repositories/color_generator_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ColorGeneratorRepositoryImpl colorGeneratorRepositoryImpl;

  setUp(() {
    colorGeneratorRepositoryImpl = ColorGeneratorRepositoryImpl();
  });

  group('ColorGeneratorRepositoryImpl', () {
    test(
      'should return a Color object encapsulated in a Right',
      () async {
        // Act
        final result = colorGeneratorRepositoryImpl.generateRandomColor();
        // Assert
        expect(result, isA<Right<Failure, Color>>());
      },
    );
  });
}
