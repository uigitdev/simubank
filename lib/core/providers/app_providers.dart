import 'package:simubank/simubank.dart';

class AppProviders {
  static final _instance = AppProviders._internal();

  AppProviders._internal();

  factory AppProviders() => _instance;

  /// Set main providers which is working during the app lifetime.
  List<BlocProvider> mainProviders() {
    return [
      BlocProvider<ThemeCubit>(
        create: (context) {
          return ThemeCubit();
        },
      ),
      BlocProvider<InitializeBloc>(
        create: (context) {
          return InitializeBloc(GetSessionUseCase());
        },
      ),
      BlocProvider<UserBloc>(
        create:
            (context) => UserBloc(
          GetUserProfileDetailsUseCase(
            UserRepositoryImpl(UserRemoteDataSourcesImpl(), UserCacheDataSourcesImpl()),
          ),
          DeleteUserProfileUseCase(
            UserRepositoryImpl(UserRemoteDataSourcesImpl(), UserCacheDataSourcesImpl()),
          ),
        ),
      ),
      BlocProvider<AuthBloc>(
        create: (context) {
          return AuthBloc(
            AuthLoginUseCase(AuthRepositoryImpl(AuthDataSourcesImpl())),
            SetSessionUseCase(),
            GetObfuscationKeyUseCase(AuthRepositoryImpl(AuthDataSourcesImpl())),
            RemoveSessionUseCase(),
          );
        },
      ),
    ];
  }

  /// Set providers by [RouteName] item.
  List<BlocProvider> getProviderByRoute(RouteName route) => switch (route) {
    RouteName.initialize => [],
    RouteName.unknown => [],
    RouteName.home => [
      BlocProvider<TransactionsBloc>(
        create:
            (context) => TransactionsBloc(
              GetTransactionUseCase(
                TransactionRepositoryImpl(TransactionDataSourceImpl()),
              ),
              SearchTransactionUseCase(),
            ),
      ),
    ],
    RouteName.auth => [],
  };
}
