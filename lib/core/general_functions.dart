import 'package:easy_birthday/core/consts.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'dart:typed_data';
import 'dart:convert';

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

Uint8List stringToUint8List(String str) => Uint8List.fromList(utf8.encode(str));
