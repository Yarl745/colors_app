import 'package:colors_app/injection_container.dart';
import 'package:colors_app/presentation/views/random_color_page/random_color_page.dart';
import 'package:flutter/material.dart';

void main() async {
  // Initialize the dependency injection container.
  await InjectionContainer().init();

  // Run the app with MyApp as the root widget.
  runApp(const MyApp());
}

/// The root widget of the application.
class MyApp extends StatelessWidget {
  /// Constructs an instance of MyApp.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Disables the debug banner.
      home: RandomColorPage(), // Sets the home page of the app.
    );
  }
}
