import 'package:colors_app/data/repositories/color_generator_repository_impl.dart';
import 'package:colors_app/domain/repositories/color_generator_repository.dart';
import 'package:colors_app/presentation/view_models/random_color_page_view_model/random_color_page_view_model.dart';
import 'package:get_it/get_it.dart';

/// Service Locator instance for dependency injection.
final sl = GetIt.instance;

/// Sets up and registers dependencies for the app.
class InjectionContainer {
  /// Initializes and registers dependencies asynchronously.
  Future<void> init() async {
    // DataSources

    // Repositories
    sl.registerFactory<ColorGeneratorRepository>(
      ColorGeneratorRepositoryImpl.new,
    );

    // ViewModels
    sl.registerFactory<RandomColorPageViewModel>(
      () => RandomColorPageViewModel(
        colorGeneratorRepository: sl(),
      ),
    );
  }
}
