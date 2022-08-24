extension StringExtension on String {
  String removeFirstNLines(int n) {
    List<String> splitData = split('\n');
    splitData.removeRange(0, n);
    return splitData.join('\n');
  }
}
