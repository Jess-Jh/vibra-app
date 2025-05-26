import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';

class PkceUtils {
  /// Genera un `code_verifier` aleatorio de longitud [length] (por defecto 128)
  static String generateCodeVerifier({int length = 128}) {
    const charset =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._~';
    final rand = Random.secure();
    return List.generate(
      length,
      (_) => charset[rand.nextInt(charset.length)],
    ).join();
  }

  /// Genera un `code_challenge` codificado en base64 URL-safe usando SHA256
  static String generateCodeChallenge(String codeVerifier) {
    final bytes = utf8.encode(codeVerifier);
    final digest = sha256.convert(bytes);
    return base64UrlEncode(
      digest.bytes,
    ).replaceAll('=', '').replaceAll('+', '-').replaceAll('/', '_');
  }
}
