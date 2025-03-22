import 'package:simubank/simubank.dart';

enum RouteName {
  initialize(InitializePage()),
  unknown(UnknownPage());

  const RouteName(this.page);

  final Widget page;
}
