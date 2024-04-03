import 'package:colors_app/injection_container.dart';
import 'package:colors_app/presentation/view_models/random_color_page_view_model/random_color_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

/// A StatefulWidget for displaying a page that updates its background color.
class RandomColorPage extends StatefulWidget {
  /// Constructs a RandomColorPage widget.
  const RandomColorPage({super.key});

  @override
  State<RandomColorPage> createState() => _RandomColorPageState();
}

class _RandomColorPageState extends State<RandomColorPage> {
  final _randomColorPageViewModel = sl<RandomColorPageViewModel>();

  @override
  void initState() {
    super.initState();
    _randomColorPageViewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _randomColorPageViewModel.updateBgColor,
      child: Observer(
        builder: (_) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: _randomColorPageViewModel.dynamicBgColor,
            ),
            child: Center(
              child: Text(
                "Hello there",
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 36,
                  color: _randomColorPageViewModel.contrastTextColor,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
