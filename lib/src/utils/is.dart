bool matches(String str, String pattern) {
  RegExp re = RegExp(pattern);
  return re.hasMatch(str);
}

bool isEmpty(String? str) {
  return str == null || str.isEmpty;
}

RegExp _surrogatePairsRegExp = RegExp(r'[\uD800-\uDBFF][\uDC00-\uDFFF]');

bool isLength(String str, int min, [int? max]) {
  List surrogatePairs = _surrogatePairsRegExp.allMatches(str).toList();
  int len = str.length - surrogatePairs.length;
  return len >= min && (max == null || len <= max);
}

RegExp _numeric = RegExp(r'^-?[0-9]+$');

bool isNumeric(String str) {
  return _numeric.hasMatch(str);
}

RegExp _int = RegExp(r'^(?:-?(?:0|[1-9][0-9]*))$');

bool isInt(String str) {
  return _int.hasMatch(str);
}

RegExp _email = RegExp(r"^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$");

bool isEmail(String str) {
  return _email.hasMatch(str);
}

RegExp _mobile = RegExp(
    r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');

bool isMobile(String str) {
  return _mobile.hasMatch(str);
}

RegExp _url = RegExp(
    r"((http|https)://)(www.)?[a-zA-Z0-9@:%._\\+~#?&//=]{2,256}\\.[a-z]{2,6}\\b([-a-zA-Z0-9@:%._\\+~#?&//=]*)");

bool isURL(String str) {
  return _url.hasMatch(str);
}

bool isDate(String str) {
  try {
    DateTime.parse(str);
    return true;
  } catch (e) {
    return false;
  }
}
