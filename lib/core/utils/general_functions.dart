import 'dart:io';
import 'dart:math' as math;

import 'package:age_calculator/age_calculator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_birthday/core/constants/app_constants.dart';
import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/features/user/data/models/role_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

String getFlag(String name) {
  return switch (name) {
    "israel" || "he" => israelFlag,
    "usa" || "en" => usaFlag,
    "druze" => druzeFlag,
    "russia" => russiaFlag,
    "france" => franceFlag,
    _ => "null",
  };
}

String dateTimeToString(DateTime date) => DateFormat('dd/MM/yyyy').format(date);

Timestamp? dateTimeToTimestamp(DateTime? date) =>
    date != null ? Timestamp.fromDate(date) : null;

DateTime? timestampToDateTime(Timestamp? timestamp) => timestamp?.toDate();

String calculateNextAge() {
  final DateTime? dateOfBirth = SessionService().user.role.isPartner()
      ? SessionService().user.dateOfBirth
      : SessionService().partner?.dateOfBirth;
  if (dateOfBirth == null) return '';
  final DateDuration currentAge = AgeCalculator.age(dateOfBirth);
  final DateDuration nextBirthday = AgeCalculator.timeToNextBirthday(
    dateOfBirth,
  );
  if (nextBirthday.months <= 2) {
    currentAge.years++;
  }
  return currentAge.years.toString();
}

String getRandomString(int stringLength) {
  const chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  // Event ids made with this are shared access keys: use a CSPRNG.
  final math.Random rnd = math.Random.secure();
  return String.fromCharCodes(
    Iterable.generate(
      stringLength,
      (_) => chars.codeUnitAt(rnd.nextInt(chars.length)),
    ),
  );
}

// Picker output is scaled down (and iPhone HEIC converted to JPEG) so photos
// upload reliably and fast and full 12MP originals never sit in memory.
const double _pickedImageMaxSize = 1600;
const int _pickedImageQuality = 85;

Future<File?> pickImageImagePicker() async {
  final XFile? image = await ImagePicker().pickImage(
    source: ImageSource.gallery,
    maxWidth: _pickedImageMaxSize,
    maxHeight: _pickedImageMaxSize,
    imageQuality: _pickedImageQuality,
  );
  return image == null ? null : File(image.path);
}

/// Picks gallery photos (or videos when [videos] is true).
///
/// [limit] caps how many photos the system picker lets the user select, so
/// the picker never resizes more than can be kept: 0 or less opens nothing,
/// 1 opens the single-photo picker. Videos come from the file picker, which
/// has no limit; callers still trim the result.
Future<List<File>> pickMultipleFiles({bool videos = false, int? limit}) async {
  if (!videos) {
    if (limit != null && limit <= 0) return [];
    if (limit == 1) {
      final File? image = await pickImageImagePicker();
      return [?image];
    }
    final List<XFile> images = await ImagePicker().pickMultiImage(
      maxWidth: _pickedImageMaxSize,
      maxHeight: _pickedImageMaxSize,
      imageQuality: _pickedImageQuality,
      limit: limit,
    );
    return [for (final image in images) File(image.path)];
  }
  final List<PlatformFile> files = await FilePicker.pickFiles(
    type: FileType.video,
  );
  return [
    for (final file in files)
      if (file.path case final String path) File(path),
  ];
}

List<Widget> surpriseMapToWidgets(Map<int, Map<String, String>>? widgetsMap) {
  if (widgetsMap == null) return [];
  final List<Map<String, String>> sortedValues = [
    for (final entry
        in widgetsMap.entries.toList()
          ..sort((e1, e2) => e1.key.compareTo(e2.key)))
      entry.value,
  ];
  return [
    for (final value in sortedValues)
      if (value.isNotEmpty)
        if (_surpriseItemToWidget(value.entries.first) case final Widget widget)
          widget,
  ];
}

Widget? _surpriseItemToWidget(MapEntry<String, String> element) {
  return switch (element.key) {
    "title" => Text(element.value, style: AppTextStyle().subTitle),
    "description" => Text(element.value, style: AppTextStyle().description),
    // Decode at display size instead of the full-resolution upload.
    // Editor/display read the URL back from its ResizeImage(NetworkImage).
    "image" => Image.network(
      element.value,
      height: 150,
      cacheHeight: 450,
      errorBuilder: (_, _, _) =>
          const Icon(Icons.broken_image_outlined, color: Colors.grey),
    ),
    _ => null,
  };
}
