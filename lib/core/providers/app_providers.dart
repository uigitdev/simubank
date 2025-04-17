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
    RouteName.initialize => [
      BlocProvider<InitializeBloc>(
        create: (context) {
          return InitializeBloc(GetSessionUseCase())..add(InitializeStart());
        },
      ),
    ],
    RouteName.unknown => [],
    RouteName.home => [
      BlocProvider<UserBloc>(
        create:
            (context) => UserBloc(
              GetUserProfileDetailsUseCase(
                UserRepositoryImpl(
                  UserRemoteDataSourcesImpl(),
                  UserCacheDataSourcesImpl(),
                ),
              ),
              DeleteCachedUserProfileUseCase(
                UserRepositoryImpl(
                  UserRemoteDataSourcesImpl(),
                  UserCacheDataSourcesImpl(),
                ),
              ),
            ),
      ),
      BlocProvider<TransactionsBloc>(
        create:
            (context) => TransactionsBloc(
              GetTransactionUseCase(
                TransactionRepositoryImpl(
                  TransactionsRemoteDataSourcesImpl(),
                  TransactionsCacheDataSourcesImpl(),
                ),
              ),
              SearchTransactionUseCase(),
              DeleteCachedTransactionsUseCase(
                TransactionRepositoryImpl(
                  TransactionsRemoteDataSourcesImpl(),
                  TransactionsCacheDataSourcesImpl(),
                ),
              ),
            ),
      ),
    ],
    RouteName.auth => [],
  };
}
