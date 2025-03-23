import 'package:simubank/simubank.dart';

enum RouteName {
  initialize(InitializePage()),
  home(HomePage()),
  auth(AuthPage()),
  unknown(UnknownPage());

  const RouteName(this.page);

  final Widget page;
}
