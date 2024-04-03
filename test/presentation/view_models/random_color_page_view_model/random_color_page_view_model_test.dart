import 'package:colors_app/core/error/failure.dart';
import 'package:colors_app/core/extensions/color_ext.dart';
import 'package:colors_app/domain/repositories/color_generator_repository.dart';
import 'package:colors_app/presentation/view_models/random_color_page_view_model/random_color_page_view_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<ColorGeneratorRepository>()])
import 'random_color_page_view_model_test.mocks.dart';

void main() {
  late MockColorGeneratorRepository mockColorGeneratorRepository;
  late RandomColorPageViewModel viewModel;

  setUp(() {
    mockColorGeneratorRepository = MockColorGeneratorRepository();
    viewModel = RandomColorPageViewModel(
      colorGeneratorRepository: mockColorGeneratorRepository,
    );
  });

  group('RandomColorPageViewModel', () {
    test('init should trigger updateBgColor', () {
      // Arrange
      when(mockColorGeneratorRepository.generateRandomColor())
          .thenAnswer((_) => const Right(Colors.blue));

      // Act
      viewModel.init();

      // Assert
      verify(mockColorGeneratorRepository.generateRandomColor()).called(1);
    });

    test('updateBgColor should update dynamicBgColor on success', () {
      // Arrange
      const expectedColor = Colors.blue;
      when(mockColorGeneratorRepository.generateRandomColor())
          .thenAnswer((_) => const Right(expectedColor));

      // Act
      viewModel.updateBgColor();

      // Assert
      expect(viewModel.dynamicBgColor, equals(expectedColor));
    });

    test('updateBgColor should not change dynamicBgColor on failure', () {
      // Arrange
      when(mockColorGeneratorRepository.generateRandomColor())
          .thenAnswer((_) => const Left(Failure()));

      // Initial color
      final initialColor = viewModel.dynamicBgColor;

      // Act
      viewModel.updateBgColor();

      // Assert
      expect(viewModel.dynamicBgColor, equals(initialColor));
    });

    test('contrastTextColor should return the contrast color of dynamicBgColor',
        () {
      // Arrange
      const bgColor = Colors.blue;
      when(mockColorGeneratorRepository.generateRandomColor())
          .thenAnswer((_) => const Right(bgColor));

      // Act
      viewModel.updateBgColor();

      // Assert
      expect(viewModel.contrastTextColor, equals(bgColor.contrast));
    });
  });
}
