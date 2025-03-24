extension StringReplaces on String {
  String atReplacer({required String value}) => replaceAll('@', value);
  String charReplacer(String char, {required String value}) => replaceAll(char, value);
}

extension ListSublist<T> on List<T> {
  List<T> getSublist(int start, int count) {
    if (isEmpty || start >= length) return [];
    final end = (start + count).clamp(0, length);
    return sublist(start, end);
  }
}