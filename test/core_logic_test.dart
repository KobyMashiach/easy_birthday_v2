import 'dart:math';
import 'dart:typed_data';

import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/check_platform.dart';
import 'package:easy_birthday/core/utils/countries/countries_functions.dart';
import 'package:easy_birthday/core/utils/general_functions.dart';
import 'package:easy_birthday/core/utils/i18n/slang_settings.dart';
import 'package:easy_birthday/core/utils/media_utils.dart';
import 'package:easy_birthday/features/event/data/models/calendar_converters_json.dart';
import 'package:easy_birthday/core/utils/ready_texts.dart';
import 'package:easy_birthday/features/home/presentation/utils/category_templates.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart' as img;

void main() {
  setUp(SessionService().reset);

  group('calendarDayKey', () {
    test('local and UTC instants of the same day map to one key', () {
      final local = DateTime(2026, 3, 14, 18, 30);
      final utcMidnight = DateTime.utc(2026, 3, 14);
      expect(calendarDayKey(local), calendarDayKey(utcMidnight));
      expect(calendarDayKey(local).isUtc, isTrue);
    });
  });

  group('ready texts', () {
    test(
      'missing chosen-text key returns empty string instead of throwing',
      () {
        expect(getTextChosenMap({}, 'title_text'), '');
        expect(
          getTextChosenMap({'title_text': 'Happy'}, 'title_text'),
          'Happy',
        );
      },
    );
  });

  group('calculateNextAge', () {
    test('returns empty when no birth date is known', () {
      SessionService().partner = null;
      expect(calculateNextAge(), '');
    });
  });

  group('categoriesList', () {
    test('builds without a loaded partner', () {
      SessionService().partner = null;
      expect(categoriesList, isNotEmpty);
    });
  });

  group('image upload shrinking', () {
    // Regression: uploading several big photos used to leave some of them
    // broken, because lowering JPEG quality alone couldn't get a detailed
    // 12MP photo under 500KB, and the upload was then saved with an empty URL.
    test('a detailed 12MP photo always fits under the 500KB upload limit', () {
      final random = Random(1);
      final photo = img.Image(width: 4032, height: 3024);
      for (final pixel in photo) {
        pixel
          ..r = random.nextInt(256)
          ..g = random.nextInt(256)
          ..b = random.nextInt(256);
      }
      final Uint8List original = img.encodePng(photo);
      const maxSize = 500 * 1024;
      expect(original.lengthInBytes, greaterThan(maxSize));

      final Uint8List? shrunk = shrinkImageBytes(original, maxSize);

      expect(shrunk, isNotNull);
      expect(shrunk!.lengthInBytes, lessThanOrEqualTo(maxSize));
      expect(img.decodeJpg(shrunk), isNotNull);
    });
  });

  group('splitPhone', () {
    test('picks the longest dial code, not the first prefix match', () {
      expect(CountriesFunctions().splitPhone('+18761234567'), (
        '+1876',
        '1234567',
      ));
      expect(CountriesFunctions().splitPhone('+972501234567'), (
        '+972',
        '501234567',
      ));
      expect(CountriesFunctions().splitPhone('0501234567'), (
        null,
        '0501234567',
      ));
    });
  });

  test('Wear OS check is false off Android (no crash on iOS)', () async {
    expect(await checkIfWearOS(), isFalse);
  });

  test('default language follows the device, Hebrew when unsupported', () {
    expect(defaultLanguageCode(const Locale('he', 'IL')), 'he');
    expect(defaultLanguageCode(const Locale('en', 'US')), 'en');
    expect(defaultLanguageCode(const Locale('fr', 'FR')), 'he');
  });
}
