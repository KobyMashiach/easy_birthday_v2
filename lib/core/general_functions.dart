import 'package:age_calculator/age_calculator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_birthday/core/consts.dart';
import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/models/persona_model/role_model.dart';
import 'package:flutter/foundation.dart';
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
  const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  math.Random _rnd = math.Random();
  return String.fromCharCodes(Iterable.generate(
      stringLength, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}
