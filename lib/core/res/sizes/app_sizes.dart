import 'package:flutter/cupertino.dart';

class AppSizes {
  final BuildContext context;

  AppSizes(this.context);

  double get paddingPageBottom => 25;
  double get paddingHorizontal => 15;
  double get paddingVertical => 15;
  double get paddingAuthHorizontal => 40;
  double get paddingHomeHorizontal => 40;
  double get paddingButtonInternalVertical => 15;

  double get buttonRadius => 8;
  double get buttonCircularIndicator => 15;
  double get buttonCircularIndicatorStroke => 3;

  double get label => 13;
  double get titleNormal => 15;
  double get titleMedium => 17;
  double get titleLarge => 30;
  double get titleLarge2 => 25;

  double get tileRadius => 6;
  double get inputRadius => 8;
  double get filterInputHeight => 40;
  double get inputHeight => 50;
  double get inputBorderWeight => 1;
  double get inputDecorationHorizontal => 10;
  double get inputIconSize => 22;

  double get appLogoSize => 70;
  double get appBarTitle => 25;

  double get filterIconSize => 25;
}
