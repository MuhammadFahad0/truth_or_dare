import 'dart:async';
import 'package:hive/hive.dart';

class OperationManager {
  static final OperationManager _singleton = OperationManager._internal();

  factory OperationManager() {
    return _singleton;
  }

  OperationManager._internal();

  /// *********************************  Hive Full  *********************************

  Future<int> getHiveListLength({required String bondType}) async {
    Box box = await Hive.openBox<String>(bondType);
    return box.values.length;
  }

  Future<List> getHiveList({required String bondType}) async {
    Box box = await Hive.openBox<String>(bondType);
    return box.values.toList();
  }

  Future<bool> setHiveList({required String bondType, required List<String> data}) async {
    try {
      Box box = await Hive.openBox<String>(bondType);
      await box.clear();
      for (var value in data) {
        box.put(value, value);
      }
      return true;
    } catch (_) {
      return false;
    }
  }

}
