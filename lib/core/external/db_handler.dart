import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:untorneo_mobile/core/logger/logger.dart';

final dbHandlerProvider = Provider<DBHandler>((ref) {
  return DBHandlerImpl();
});

abstract class DBHandler {
  Future<String?> get(String key, String boxName);
  Future<void> put(String key, String value, String boxName);
  Future<void> update(String key, String value, String boxName);
  Future<void> delete(String key, String boxName);
  Future<Box> getBox(String boxName);
}

class DBHandlerImpl implements DBHandler {
  @override
  Future<void> delete(String key, String boxName) async {
    Logger.log('Deleting $key from $boxName');
    final box = await getBox(boxName);
    return box.delete(key);
  }

  @override
  Future<String?> get(String key, String boxName) async {
    Logger.log('Getting $key from $boxName');
    final box = await getBox(boxName);
    return box.get(key);
  }

  @override
  Future<void> put(String key, String value, String boxName) async {
    Logger.log('Putting $value to $key in $boxName');
    final box = await getBox(boxName);
    return box.put(key, value);
  }

  @override
  Future<void> update(String key, String value, String boxName) async {
    Logger.log('Updating $value to $key in $boxName');
    final box = await getBox(boxName);
    return box.put(key, value);
  }

  @override
  Future<Box> getBox(String boxName) => Hive.openBox(boxName);
}
