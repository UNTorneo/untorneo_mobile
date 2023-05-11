import 'dart:convert';
import 'dart:typed_data';

extension Uint8ListExtension on Uint8List {
  String get toBase64 => base64Encode(this);
}