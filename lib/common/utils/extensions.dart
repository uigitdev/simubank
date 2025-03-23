extension StringReplaces on String {
  String atReplacer({required String value}) => replaceAll('@', value);
  String charReplacer(String char, {required String value}) => replaceAll(char, value);
}
