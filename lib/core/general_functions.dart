import 'package:easy_birthday/core/consts.dart';

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
