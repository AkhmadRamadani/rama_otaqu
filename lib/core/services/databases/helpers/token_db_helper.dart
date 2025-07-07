import 'package:hive_ce/hive.dart';
import 'package:rama_otaqu/core/services/databases/constants/hive_constant.dart';

class TokenDbHelper {
  Box<String> get _box => Hive.box<String>(HiveConstant.stringBox);

  Future<void> putToken(String token) async {
    await _box.put(HiveConstant.tokenKey, token);
  }

  String? getToken() {
    return _box.get(HiveConstant.tokenKey);
  }

  Future<void> deleteToken() async {
    await _box.delete(HiveConstant.tokenKey);
  }

  Future<bool> isTokenExists() async {
    return _box.containsKey(HiveConstant.tokenKey);
  }

  Future<void> clear() async {
    await _box.clear();
  }
}
