import 'package:simubank/simubank.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with AppUIHelper {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppEmptyAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes(context).paddingAuthHorizontal,
              ),
              child: BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthAuthenticatedSuccess) {
                    serviceLocator<AppRoutes>().go(RouteName.home);
                  } else if (state is AuthAuthenticationFailed) {
                    showErrorSnackbar(context, state.message);
                  }
                },
                child: BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    final isInProgress = state is AuthInProgress;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: AppSizes(context).paddingVertical,
                          ),
                          child: AuthLogo(),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: AppSizes(context).paddingVertical,
                          ),
                          child: Semantics(
                            label: AppStrings.authLogin,
                            child: Text(
                              AppStrings.authLogin,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ),
                        FocusTraversalGroup(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  bottom: AppSizes(context).paddingVertical,
                                ),
                                child: Semantics(
                                  label: AppStrings.authEmailHint,
                                  child: AppInputField(
                                    key: Key(AppStrings.authEmailHint),
                                    controller: emailController,
                                    hint: AppStrings.authEmailHint,
                                    action: TextInputAction.next,
                                    inputType: TextInputType.emailAddress,
                                    capitalization: TextCapitalization.none,
                                    isAutofocus: true,
                                    isEnabled: !isInProgress,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  bottom: AppSizes(context).paddingVertical,
                                ),
                                child: Semantics(
                                  label: AppStrings.authPasswordHint,
                                  child: AppInputField(
                                    key: Key(AppStrings.authPasswordHint),
                                    controller: passwordController,
                                    hint: AppStrings.authPasswordHint,
                                    action: TextInputAction.next,
                                    inputType: TextInputType.visiblePassword,
                                    capitalization: TextCapitalization.none,
                                    isAutofocus: true,
                                    isEnabled: !isInProgress,
                                    iconAsset: AppIcons.password,
                                    showPasswordIconAsset: AppIcons.showPassword,
                                    onSubmitted:
                                        (text) => _loginSubmitFunction(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: AppSizes(context).paddingVertical,
                          ),
                          child: Semantics(
                            label: AppStrings.authLogin,
                            child: AuthButton(
                              key: Key('login'),
                              isEnabled: !isInProgress,
                              showProgress: isInProgress,
                              title: AppStrings.authLogin.toUpperCase(),
                              onTap: _loginSubmitFunction,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: AppSizes(context).paddingVertical,
                          ),
                          child: Semantics(
                            label: AppStrings.authNoAccount,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                AppStrings.authNoAccount,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: AppSizes(context).paddingVertical,
                          ),
                          child: Semantics(
                            label: AppStrings.authRegistration,
                            child: AuthButton(
                              key: Key('registration'),
                              isEnabled: false,
                              title: AppStrings.authRegistration.toUpperCase(),
                              onTap: () {
                                //TODO (TDavid): implement registration button.
                                throw UnimplementedError();
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),

          /// Hide version number if keyboard is open.
          KeyboardVisibilityBuilder(
            builder: (context, isVisible) {
              return Visibility(
                visible: !isVisible,
                replacement: const SizedBox(),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: AppSizes(context).paddingHorizontal,
                      right: AppSizes(context).paddingHorizontal,
                      bottom: AppSizes(context).paddingPageBottom,
                    ),
                    child: AuthVersionTitle(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _loginSubmitFunction() => context.read<AuthBloc>().add(
    AuthLogin(email: emailController.text, password: passwordController.text),
  );
}
