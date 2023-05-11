import 'package:flutter/material.dart';

extension DateOfTimeExtension on TimeOfDay {
  String get formated => '$hour:${minute < 10 ? '0$minute' : minute}';
}

extension StringDateOfTimeExtension on String {
  TimeOfDay get toTimeOfDay {
    final split = this.split(':');
    return TimeOfDay(hour: int.parse(split[0]), minute: int.parse(split[1]));
  }
}
