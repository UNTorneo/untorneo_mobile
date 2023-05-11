import 'dart:ui';
import 'package:untorneo_mobile/core/logger/logger.dart';

extension ColorExtension on Color {
  String get toRgbString {
    return '$red,$green,$blue';
  }
}

extension ToColorExtension on String {
  Color? get toColor {
    try {
      final rgb = split(',').map((e) => int.parse(e.trim())).toList();
      return Color.fromRGBO(rgb[0], rgb[1], rgb[2], 1);
    } catch (e, s) {
      Logger.logError(e.toString(), s);
      return null;
    }
  }
}
