import 'package:encrypt/encrypt.dart' as encrypt;

class MyEncryptionDecryption {
  static final keyFernet =
      encrypt.Key.fromUtf8('my32lengthsupersecretnooneknows1');

  static final fernet = encrypt.Fernet(keyFernet);
  static final encrypterFernet = encrypt.Encrypter(fernet);

  static encrypt.Encrypted encryptFernet(text) {
    final encrypted = encrypterFernet.encrypt(text);
    return encrypted;
  }

  static String getDecryptFromString(encrypt.Encrypted encypted) =>
      decryptFernet(encypted);

  static encrypt.Encrypted getEncryptedFromString(String text) =>
      encrypt.Encrypted.fromBase64(text);

  static String getStringFromEncrypted(String text) =>
      getDecryptFromString(getEncryptedFromString(text));

  static String decryptFernet(encrypt.Encrypted encrypted) {
    return encrypterFernet.decrypt(encrypted);
  }
}
