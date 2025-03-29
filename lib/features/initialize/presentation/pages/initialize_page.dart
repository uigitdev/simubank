import 'package:simubank/simubank.dart';

class InitializePage extends StatelessWidget {
  const InitializePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<InitializeBloc, InitializeState>(
      listener: (context, state) {
        return switch (state) {
          InitializeNone _ => {},
          InitializeAuthenticated _ => serviceLocator<AppRoutes>().go(
            RouteName.home,
          ),
          InitializeUnauthenticated _ => serviceLocator<AppRoutes>().go(
            RouteName.auth,
          ),
        };
      },
      child: Scaffold(
        appBar: AppEmptyAppBar(),
        body: Center(
          child: SizedBox(
            width: AppSizes(context).appLogoSize,
            height: AppSizes(context).appLogoSize,
            child: Placeholder(),
          ),
        ),
      ),
    );
  }
}
