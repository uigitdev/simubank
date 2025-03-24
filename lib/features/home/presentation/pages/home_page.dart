import 'package:flutter/cupertino.dart';
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
      context.read<TransactionsBloc>().add(TransactionsGetTransactions());
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
              child: Semantics(
                label: AppStrings.logout,
                child: IconButton(
                  tooltip: AppStrings.logout,
                  onPressed: () => context.read<AuthBloc>().add(AuthLogout()),
                  icon: Icon(
                    Icons.exit_to_app_rounded,
                    color: Theme.of(context).appBarTheme.actionsIconTheme?.color,
                  ),
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
                BlocBuilder<TransactionsBloc, TransactionsState>(
                  builder: (context, state) {
                    switch (state) {
                      case TransactionsNone _:
                        return Expanded(
                          child: Center(child: CupertinoActivityIndicator()),
                        );
                      case TransactionsLoadedTransactions params:
                        return Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              HomeTransactionFilterBox(
                                controller: filterController,
                                onSearch: (text) {
                                  context.read<TransactionsBloc>().add(
                                    TransactionsSearchTransaction(text),
                                  );
                                },
                              ),
                              Expanded(
                                child: Visibility(
                                  visible: params.transactions.isNotEmpty,
                                  replacement: Center(
                                    child: Text(AppStrings.transactionsEmpty),
                                  ),
                                  child: HomeTransactionList(
                                    params.transactions,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      case TransactionLoadFailed _:
                        return Expanded(
                          child: Center(
                            child: Text(AppStrings.transactionsEmpty),
                          ),
                        );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
