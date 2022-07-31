import 'dart:convert';

import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart' as crypto;

String md5(String s) {
  var content = const Utf8Encoder().convert(s);
  var digest = crypto.md5.convert(content);
  return hex.encode(digest.bytes);
}

class Base64 {
  static encode(String s) {
    var content = utf8.encode(s);
    var digest = base64Encode(content);
    return digest;
  }

  static decode(String s) {
    List<int> bytes = base64Decode(s);
    String result = utf8.decode(bytes);
    return result;
  }
}

class XorBase64 {
  static String xorCode(String s, String key) {
    List<String> keyList = key.split(',');
    List<int> codeUnits = s.codeUnits;
    List<int> codes = [];
    for (int i = 0, length = codeUnits.length; i < length; i++) {
      int code = codeUnits[i] ^ int.parse(keyList[i % keyList.length]);
      codes.add(code);
    }
    return String.fromCharCodes(codes);
  }

  static encode(String s, String key) {
    String encode = xorCode(s, key);
    encode = Base64.encode(encode);
    return encode;
  }

  static decode(String s, String key) {
    String encode = Base64.decode(s);
    encode = xorCode(encode, key);
    return encode;
  }
}
