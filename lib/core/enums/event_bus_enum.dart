import 'package:collection/collection.dart';

enum EventBusEvents {
  menuUpdated(value: 'menu:updated');

  const EventBusEvents({required this.value});

  final String value;

  static EventBusEvents? fromValue(String value) =>
      EventBusEvents.values.firstWhereOrNull((e) => e.value == value);
}
