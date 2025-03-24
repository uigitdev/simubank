import 'package:simubank/simubank.dart';

class AppIcons{
  AppIcons._();

  static String prefix = 'assets/icon/';

  static String get  password => '${prefix}password.svg';
  static String get  showPassword => '${prefix}show_password.svg';
  static String get  filter => '${prefix}filter.svg';
  static String get  search => '${prefix}search.svg';

  static IconData get close => Icons.close_rounded;
}