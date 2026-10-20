import 'package:easy_birthday/core/services/encryption_service.dart';
import 'package:easy_birthday/core/services/firebase/password_auth.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('authEmailForPhone', () {
    test('uses only the digits of the phone number', () {
      expect(
        authEmailForPhone('+972501234567'),
        '972501234567@easybirthday.app',
      );
      expect(
        authEmailForPhone('+972 50-123-4567'),
        '972501234567@easybirthday.app',
      );
    });

    test('same phone always maps to the same login email', () {
      expect(
        authEmailForPhone('+972501234567'),
        authEmailForPhone('+972501234567'),
      );
    });
  });

  group('legacyPassword', () {
    test('decrypts a password stored by older app versions', () {
      final stored = MyEncryptionDecryption.encryptFernet('secret123').base64;
      expect(legacyPassword(stored), 'secret123');
    });

    test('is null for migrated accounts (no stored password)', () {
      expect(legacyPassword(''), isNull);
    });

    test('is null instead of throwing for corrupt data', () {
      expect(legacyPassword('not-a-fernet-token'), isNull);
    });
  });
}
