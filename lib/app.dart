import 'simubank.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return MaterialApp.router(
          title: AppStrings.appName,
          debugShowCheckedModeBanner: false,
          theme: AppThemes(context).light,
          darkTheme: AppThemes(context).dark,
          themeMode: themeMode,
          routerConfig: serviceLocator<AppRoutes>().router,
        );
      },
    );
  }
}
