import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:untorneo_mobile/core/extensions/date_of_time_extension.dart';

enum Weekdays {
  monday(spanishName: 'Lunes'),
  tuesday(spanishName: 'Martes'),
  wednesday(spanishName: 'Miercoles'),
  thursday(spanishName: 'Jueves'),
  friday(spanishName: 'Viernes'),
  saturday(spanishName: 'Sabado'),
  sunday(spanishName: 'Domingo'),
  holiday(spanishName: 'Festivos');

  const Weekdays({required this.spanishName});

  static Weekdays? fromName(String name) {
    return values.firstWhereOrNull((e) => e.spanishName == name);
  }

  final String spanishName;
}

class Weekday {
  Weekday(
    this.weekday, {
    this.openTime = const TimeOfDay(hour: 8, minute: 0),
    this.closeTime = const TimeOfDay(hour: 20, minute: 0),
  });

  factory Weekday.fromMap(Map<String, dynamic> map) {
    return Weekday(
      Weekdays.values.firstWhere((e) => e.name == map['weekday'] as String),
      openTime: (map['openTime'] as String).toTimeOfDay,
      closeTime: (map['closeTime'] as String).toTimeOfDay,
    );
  }

  final Weekdays weekday;
  TimeOfDay openTime;
  TimeOfDay closeTime;

  static final weekdays = Weekdays.values.map((e) => Weekday(e)).toList();

  Map<String, dynamic> toMap() => {
        'weekday': weekday.name,
        'openTime': openTime.formated,
        'closeTime': closeTime.formated,
      };

  @override
  bool operator ==(covariant Weekday other) {
    if (identical(this, other)) return true;
    return other.weekday == weekday;
  }

  @override
  int get hashCode => weekday.hashCode;

  @override
  String toString() => 'Weekday(weekday: $weekday, openTime: $openTime, closeTime: $closeTime)';
}
