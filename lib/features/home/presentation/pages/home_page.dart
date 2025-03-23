import 'package:simubank/simubank.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AppUIHelper {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserBloc>().add(UserGetProfileDetails());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Semantics(
          label: AppStrings.transactions,
          child: Text(AppStrings.transactions),
        ),
        actions: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthLogoutSuccess) {
                serviceLocator<AppRoutes>().go(RouteName.initialize);
              } else if (state is AuthLogoutFailed) {
                showErrorSnackbar(context, state.message);
              }
            },
            child: IconButton(
              onPressed: () => context.read<AuthBloc>().add(AuthLogout()),
              icon: Icon(
                Icons.exit_to_app_rounded,
                color: Theme.of(context).appBarTheme.actionsIconTheme?.color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
