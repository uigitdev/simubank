import 'package:simubank/simubank.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
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
              child: Column(
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
                              isEnabled: true,
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
                              isEnabled: true,
                              iconAsset: AppIcon.password,
                              showPasswordIconAsset: AppIcon.showPassword,
                              onSubmitted: (text) {
                                //TODO
                              },
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
                        title: AppStrings.authLogin.toUpperCase(),
                        onTap: () {},
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
                        onTap: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
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
                    child: AuthVersionTitleWidget(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
