import 'package:simubank/simubank.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AppUIHelper {
  final filterController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserBloc>().add(UserGetProfileDetails());
    });
    super.initState();
  }

  @override
  void dispose() {
    filterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserGetProfileDetailsFailed) {
          showErrorSnackbar(context, state.message);
        }
      },
      child: Scaffold(
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
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes(context).paddingHomeHorizontal,
          ),
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: AppSizes(context).paddingVertical,
                  ),
                  child: HomeWelcomeTitle(),
                ),
                HomeTransactionFilterBox(
                  controller: filterController,
                  onSearch: (text) {
                    print('search');
                  },
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: 30,
                    shrinkWrap: true,
                    separatorBuilder: (context, position) {
                      return Container(
                        width: double.maxFinite,
                        height: 0.5,
                        color: Theme.of(context).disabledColor,
                      );
                    },
                    itemBuilder: (context, position) {
                      return Text('item');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
