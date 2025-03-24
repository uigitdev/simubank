import 'package:flutter/cupertino.dart';
import 'package:simubank/simubank.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AppUIHelper {
  final filterController = TextEditingController();
  final scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserBloc>().add(UserGetProfileDetails());
      context.read<TransactionsBloc>().add(TransactionsGetTransactions());
    });
    super.initState();
  }

  @override
  void dispose() {
    filterController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 100) {
      context.read<TransactionsBloc>().add(TransactionsLoadMore());
    }
  }

  @override
  Widget build(BuildContext context) {
    // Listen user profile states.
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserGetProfileDetailsFailed) {
          // Show snackbar if there is no user profile.
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
            // Listen logout states.
            BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthLogoutSuccess) {
                  // Start initialize page if logout was success.
                  serviceLocator<AppRoutes>().go(RouteName.initialize);
                } else if (state is AuthLogoutFailed) {
                  // Show error snackbar if logout failed.
                  showErrorSnackbar(context, state.message);
                }
              },
              // Show logout button on appBar.
              child: Semantics(
                label: AppStrings.logout,
                child: IconButton(
                  tooltip: AppStrings.logout,
                  onPressed: () => context.read<AuthBloc>().add(AuthLogout()),
                  icon: Icon(
                    AppIcons.exit,
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
                // Show welcome title with username.
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
                        // Show progress indicator if transaction get is in progress.
                        return Expanded(
                          child: Center(child: CupertinoActivityIndicator()),
                        );
                      case TransactionsLoadedTransactions params:
                        return Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Show transaction filter box.
                              HomeTransactionFilterBox(
                                controller: filterController,
                                onSearch: (text) {
                                  context.read<TransactionsBloc>().add(
                                    TransactionsSearchTransaction(text),
                                  );
                                },
                              ),
                              // Show the transaction list if it is not empty
                              // otherwise, display a centered message indicating
                              // that no transactions were found.
                              Expanded(
                                child: Visibility(
                                  visible: params.transactions.isNotEmpty,
                                  replacement: Center(
                                    child: Text(AppStrings.transactionsEmpty),
                                  ),
                                  child: HomeTransactionList(
                                    controller: scrollController,
                                    params.transactions,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      case TransactionLoadFailed _:
                        // Show empty transaction title if loading failed.
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
