import 'package:hive_ce/hive.dart';
import 'package:rama_otaqu/core/services/databases/constants/hive_constant.dart';

class BoolDbHelper {
  Box<bool> get _box => Hive.box<bool>(HiveConstant.boolBox);

  void putBool(String key, bool value) {
    _box.put(key, value);
  }

  bool? getBool(String key) {
    return _box.get(key);
  }

  Future<void> clear() async {
    await _box.clear();
  }

  Future<void> deleteBool(String key) async {
    await _box.delete(key);
  }
}
