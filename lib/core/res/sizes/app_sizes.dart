import 'package:flutter/cupertino.dart';

class AppSizes {
  final BuildContext context;

  AppSizes(this.context);

  double get paddingPageBottom => 25;
  double get paddingHorizontal => 15;
  double get paddingAuthHorizontal => 40;
  double get paddingButtonInternalVertical => 15;

  double get buttonRadius => 8;
  double get buttonCircularIndicator => 15;
  double get buttonCircularIndicatorStroke => 3;

  double get label => 13;
  double get buttonTitle => 17;
}
