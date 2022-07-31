String hideNumber(String text,
    {int start = 3, int end = 7, String replacement = '****'}) {
  return text.replaceRange(start, end, replacement);
}

String formatDigitPattern(String text, {int digit = 4, String pattern = ' '}) {
  text = text.replaceAllMapped(RegExp('(.{$digit})'), (Match match) {
    return '${match.group(0)}$pattern';
  });
  if (text.endsWith(pattern)) {
    text = text.substring(0, text.length - 1);
  }
  return text;
}
