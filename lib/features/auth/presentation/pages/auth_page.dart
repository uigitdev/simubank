import 'package:simubank/features/auth/presentation/widgets/auth_button.dart';
import 'package:simubank/simubank.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

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
                  Text('logo'),
                  Text('field1'),
                  Text('field2'),
                  Semantics(
                    label: AppStrings.authLogin,
                    child: AuthButton(
                      key: Key('login'),
                      title: AppStrings.authLogin.toUpperCase(),
                      onTap: () {},
                    ),
                  ),
                  Text('account creation'),
                  Semantics(
                    label: AppStrings.authRegistration,
                    child: AuthButton(
                      key: Key('registration'),
                      isEnabled: false,
                      title: AppStrings.authRegistration.toUpperCase(),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
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
        ],
      ),
    );
  }
}
