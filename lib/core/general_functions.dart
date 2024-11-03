import 'dart:io';

import 'package:age_calculator/age_calculator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_birthday/core/consts.dart';
import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/models/persona_model/role_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'dart:typed_data';
import 'dart:convert';
import 'dart:math' as math;

String cutFilePathWithoutFinish(String videoTitle) =>
    "EasyRingTube${videoTitle}_cut";

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

DateTime stringToDateTime(String str) => DateFormat('dd/MM/yyyy').parse(str);

Timestamp? dateTimeToTimestamp(DateTime? date) =>
    date != null ? Timestamp.fromDate(date) : null;

DateTime? timestampToDateTime(Timestamp? timestamp) => timestamp?.toDate();

Uint8List stringToUint8List(String str) => Uint8List.fromList(utf8.encode(str));

String calculateNextAge() {
  final DateTime dateOfBirth = globalUser.role.isPartner()
      ? globalUser.dateOfBirth!
      : globalPartnerUser!.dateOfBirth!;
  DateDuration currentAge;
  DateDuration nextBirthday;
  currentAge = AgeCalculator.age(dateOfBirth);
  nextBirthday = AgeCalculator.timeToNextBirthday(dateOfBirth);
  if (nextBirthday.months <= 2) {
    currentAge.years++;
  }
  return currentAge.years.toString();
}

String getRandomString(int stringLength) {
  const chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  math.Random rnd = math.Random();
  return String.fromCharCodes(Iterable.generate(
      stringLength, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
}

Future<File?> pickSingleImage() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.image,
    allowMultiple: false,
  );

  if (result != null && result.files.isNotEmpty) {
    return File(result.files.single.path!);
  } else {
    return null;
  }
}

Future<List<File>> pickMultipleFiles({bool? videos}) async {
  FileType fileType = videos == true ? FileType.video : FileType.image;

  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: fileType,
    allowMultiple: true,
  );

  if (result != null) {
    return result.paths.map((path) => File(path!)).toList();
  } else {
    return [];
  }
}

List<Widget> supriseMapToWidgets(Map<int, Map<String, String>>? widgetsMap) {
  List<Widget> items = [];
  if (widgetsMap != null) {
    Map<int, Map<String, String>> sortedMap = Map.fromEntries(
      widgetsMap.entries.toList()..sort((e1, e2) => e1.key.compareTo(e2.key)),
    );
    Map<int, Map<String, String>> updatedMap = {
      for (int i = 0; i < sortedMap.length; i++)
        i + 1: sortedMap.values.elementAt(i)
    };

    updatedMap.forEach(
      (key, value) {
        final element = value.entries.first;
        switch (element.key) {
          case "title":
            items.add(Text(element.value, style: AppTextStyle().subTitle));
          case "description":
            items.add(Text(element.value, style: AppTextStyle().description));
          case "image":
            items.add(Image.network(element.value, height: 150));
        }
      },
    );
  }
  return items;
}
