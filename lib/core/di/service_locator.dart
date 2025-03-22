import 'package:simubank/simubank.dart';

final serviceLocator = GetIt.instance;

void setupLocators() {
  serviceLocator.registerLazySingleton<AppRoutes>(() => AppRoutes());
  serviceLocator.registerLazySingleton<AppProviders>(() => AppProviders());
}
