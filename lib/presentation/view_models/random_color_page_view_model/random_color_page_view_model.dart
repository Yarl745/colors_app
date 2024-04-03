import 'package:colors_app/domain/repositories/color_generator_repository.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'random_color_page_view_model.g.dart';

/// ViewModel for managing the state of the Random Color Page.
class RandomColorPageViewModel = RandomColorPageViewModelBase
    with _$RandomColorPageViewModel;

/// Base ViewModel, managing color generation and updates.
abstract class RandomColorPageViewModelBase with Store {
  final ColorGeneratorRepository _colorGeneratorRepository;

  @observable
  Color _dynamicBgColor = Colors.black;

  @observable
  Color _contrastTextColor = Colors.white;

  /// Computed property to get the current background color.
  @computed
  Color get dynamicBgColor => _dynamicBgColor;

  /// Computed property to get the current contrast text color.
  @computed
  Color get contrastTextColor => _contrastTextColor;

  /// Constructor requiring a [ColorGeneratorRepository].
  RandomColorPageViewModelBase({
    required ColorGeneratorRepository colorGeneratorRepository,
  }) : _colorGeneratorRepository = colorGeneratorRepository;

  /// Initializes the ViewModel, typically called after ViewModel construction.
  void init() {
    updateBgColor();
  }

  /// Updates background and contrast text colors from the repository.
  void updateBgColor() {
    _colorGeneratorRepository.generateRandomColor().fold(
          (_) => null, // Do nothing on failure.
          (color) => _dynamicBgColor = color, // Update on success.
        );
    _colorGeneratorRepository.getContrastColor().fold(
          (_) => null, // Do nothing on failure.
          (color) => _contrastTextColor = color, // Update  on success.
        );
  }
}
