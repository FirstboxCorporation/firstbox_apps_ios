// ignore_for_file: file_names

import 'package:encrypt/encrypt.dart';
class EncryptionDecryptionQRCode {
  static final _key =
      Key.fromUtf8('967771550374najm'); // 16 byte key for AES-128
  static final _iv = IV.fromUtf8('967771550374najm'); // 16 byte IV

  static String encryptQRCode(String text) {
    final encrypter = Encrypter(AES(_key, mode: AESMode.cbc, padding: 'PKCS7'));
    final encrypted = encrypter.encrypt(text, iv: _iv);
    return encrypted.base64;
  }

  static String decryptQRCode(String encrypted) {
    final encrypter = Encrypter(AES(_key, mode: AESMode.cbc, padding: 'PKCS7'));
    final decrypted = encrypter.decrypt64(encrypted, iv: _iv);
    return decrypted;
  }
}
