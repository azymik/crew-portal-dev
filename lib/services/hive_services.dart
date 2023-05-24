import 'package:hive_flutter/hive_flutter.dart';

class HiveServices {
  static Future<dynamic> getFromBox(String boxName, dynamic key) async {
    final box = await Hive.openBox(boxName);
    return box.get(key);
  }

  static Future<void> putInBox(
      String boxName, dynamic key, dynamic value) async {
    final box = await Hive.openBox(boxName);
    await box.put(key, value);
    return;
  }

  static Future<void> putAllInBox(
      String boxName, Map<dynamic, dynamic> entries) async {
    final box = await Hive.openBox(boxName);
    await box.putAll(entries);
    return;
  }
}
