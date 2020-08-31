import 'dart:developer';

var TAG = "Break Down";

void logger(String msg) {
  log("${TAG} (${DateTime.now().toIso8601String()} : ${msg})");
}