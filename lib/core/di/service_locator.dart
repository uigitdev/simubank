import 'package:simubank/simubank.dart';

final serviceLocator = GetIt.instance;
final sessionState = SessionState();

void setupLocators() {
  _setupUseCases();
  _setupObservers();
  serviceLocator.registerLazySingleton<AppRoutes>(() => AppRoutes());
  serviceLocator.registerLazySingleton<AppProviders>(() => AppProviders());
  serviceLocator.registerLazySingleton<EventDispatcher>(() => EventDispatcher());
  serviceLocator.registerLazySingleton<TransactionsDatabaseHelper>(() => TransactionsDatabaseHelper());
}

void _setupUseCases() {
  serviceLocator.registerLazySingleton<GetSessionUseCase>(
    () => GetSessionUseCase(),
  );
}

void _setupObservers() {
  Bloc.observer = const AppBlocObserver();
}
