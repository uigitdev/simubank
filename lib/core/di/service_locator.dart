import 'package:simubank/simubank.dart';

final serviceLocator = GetIt.instance;
final sessionState = SessionState();

void setupLocators() {
  serviceLocator.registerLazySingleton<AppRoutes>(() => AppRoutes());
  serviceLocator.registerLazySingleton<AppProviders>(() => AppProviders());
}
