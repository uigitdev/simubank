import 'package:simubank/simubank.dart';

class InitializePage extends StatefulWidget {
  const InitializePage({super.key});

  @override
  State<InitializePage> createState() => _InitializePageState();
}

class _InitializePageState extends State<InitializePage> {
  @override
  void initState() {
    ///Start initializing when build initialize is ended.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<InitializeBloc>().add(InitializeStart());
    });
    super.initState();
  }

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
