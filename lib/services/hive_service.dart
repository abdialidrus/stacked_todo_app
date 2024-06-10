import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  List<T> loadBoxContents<T>(Box<T> box) {
    return box.values.toList();
  }

  void saveToBox<T>(Box<T> box, String key, T value) {
    box.put(key, value);
  }

  void deleteFromBox<T>(Box<T> box, String key) {
    box.delete(key);
  }

  T? getContentByKey<T>(Box<T> box, String key) {
    return box.get(key);
  }
}
