import 'package:simubank/simubank.dart';

class AppRoutes {
  static final _instance = AppRoutes._internal();

  AppRoutes._internal();

  factory AppRoutes() => _instance;

  final _navigatorKey = GlobalKey<NavigatorState>();

  /// Generate all registered routes by [RouteName]
  ///
  /// Set navigatorKey and generate all registered routes by RouteName.
  /// Set unknown page if path is not exists.
  GoRouter get router => GoRouter(
    navigatorKey: _navigatorKey,
    routes: _generatedRoutes(),
    initialLocation: _getPathByRouteName(initialRoute),
    errorBuilder: (context, state) => _getRouteProvider(RouteName.unknown),
  );

  /// Generate routes by [RouteName] enum and add their [providers].
  List<GoRoute> _generatedRoutes() {
    final routes = <GoRoute>[];
    for (var route in RouteName.values) {
      routes.add(
        GoRoute(
          path: _getPathByRouteName(route),
          builder: (context, state) => _getRouteProvider(route),
        ),
      );
    }
    return routes;
  }

  RouteName get initialRoute => RouteName.initialize;

  String _getPathByRouteName(RouteName routeName) =>
      _pathReplacer(routeName.name);

  String _pathReplacer(String path) =>
      '/${path.toLowerCase().replaceAll('_', '-')}';

  void pop() => _navigatorKey.currentState!.context.pop();

  void go(RouteName routeName, {Map<String, dynamic> args = const {}}) =>
      _navigatorKey.currentState!.context.go(
        _getPathByRouteName(routeName),
        extra: args,
      );

  void push(RouteName routeName, {Map<String, dynamic> args = const {}}) =>
      _navigatorKey.currentState!.context.push(
        _getPathByRouteName(routeName),
        extra: args,
      );

  /// Get page arguments map.
  static Map<String, dynamic>? getArguments(BuildContext context) =>
      GoRouterState.of(context).extra as Map<String, dynamic>?;

  /// Get route page with their providers by [RouteName].
  Widget _getRouteProvider(RouteName route) {
    final routeProvider = serviceLocator<AppProviders>().getProviderByRoute(
      route,
    );
    if (routeProvider.isEmpty) return NetworkHandlerPage(page: route.page);
    return MultiBlocProvider(
      providers: routeProvider,
      child: NetworkHandlerPage(page: route.page),
    );
  }
}
