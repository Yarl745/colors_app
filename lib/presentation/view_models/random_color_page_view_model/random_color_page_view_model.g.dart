// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'random_color_page_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RandomColorPageViewModel on RandomColorPageViewModelBase, Store {
  Computed<Color>? _$dynamicBgColorComputed;

  @override
  Color get dynamicBgColor =>
      (_$dynamicBgColorComputed ??= Computed<Color>(() => super.dynamicBgColor,
              name: 'RandomColorPageViewModelBase.dynamicBgColor'))
          .value;
  Computed<Color>? _$contrastTextColorComputed;

  @override
  Color get contrastTextColor => (_$contrastTextColorComputed ??=
          Computed<Color>(() => super.contrastTextColor,
              name: 'RandomColorPageViewModelBase.contrastTextColor'))
      .value;

  late final _$_dynamicBgColorAtom = Atom(
      name: 'RandomColorPageViewModelBase._dynamicBgColor', context: context);

  @override
  Color get _dynamicBgColor {
    _$_dynamicBgColorAtom.reportRead();
    return super._dynamicBgColor;
  }

  @override
  set _dynamicBgColor(Color value) {
    _$_dynamicBgColorAtom.reportWrite(value, super._dynamicBgColor, () {
      super._dynamicBgColor = value;
    });
  }

  @override
  String toString() {
    return '''
dynamicBgColor: ${dynamicBgColor},
contrastTextColor: ${contrastTextColor}
    ''';
  }
}
