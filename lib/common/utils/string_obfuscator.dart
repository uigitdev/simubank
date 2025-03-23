import 'package:simubank/simubank.dart';

/// Obfuscate and deobfuscate text with incoming key.
class StringObfuscator {
  final String _obfuscationKey;

  StringObfuscator(this._obfuscationKey);

  String obfuscate(String text) {
    final keyBytes = utf8.encode(_obfuscationKey);
    final textBytes = utf8.encode(text);

    final obfuscatedBytes = List<int>.generate(
      textBytes.length,
      (i) => textBytes[i] ^ keyBytes[i % keyBytes.length],
    );

    return base64Url.encode(obfuscatedBytes);
  }

  String deobfuscate(String obfuscatedText) {
    try {
      final keyBytes = utf8.encode(_obfuscationKey);
      final obfuscatedBytes = base64Url.decode(obfuscatedText);

      final originalBytes = List<int>.generate(
        obfuscatedBytes.length,
        (i) => obfuscatedBytes[i] ^ keyBytes[i % keyBytes.length],
      );

      return utf8.decode(originalBytes);
    } catch (e) {
      return obfuscatedText;
    }
  }
}
