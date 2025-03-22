import 'package:simubank/simubank.dart';

final serviceLocator = GetIt.instance;
final sessionState = SessionState();

void setupLocators() {
  _setupUseCases();
  serviceLocator.registerLazySingleton<AppRoutes>(() => AppRoutes());
  serviceLocator.registerLazySingleton<AppProviders>(() => AppProviders());
}

void _setupUseCases() {
  serviceLocator.registerLazySingleton<GetSessionUseCase>(
    () => GetSessionUseCase(),
  );
}
