part of 'init_dependencies.dart';

final locator = GetIt.instance;

Future<void> initDependencies() async {
  //only single instance throughout the app.
  locator.registerLazySingleton<ApiService>(
      () => ApiServiceImpl(client: http.Client())); //passing http client from outside.
  //viewModels
  locator.registerFactory<HomeViewModel>(() => HomeViewModel(
        apiService: locator(),
      ));
  locator.registerFactory<ModulesViewModel>(() => ModulesViewModel(
        apiService: locator(),
      ));
  locator.registerFactory<LessonViewModel>(() => LessonViewModel(
    apiService: locator(),
  ));
}
