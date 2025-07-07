import 'package:hive_ce/hive.dart';
import 'package:rama_otaqu/core/services/databases/constants/hive_constant.dart';
import 'package:rama_otaqu/core/services/databases/hive_models/destination_local_model.dart';

class RecentSearchDbHelper {
  Box<DestinationLocalModel> get _box =>
      Hive.box<DestinationLocalModel>(HiveConstant.recentSearchBox);

  Future<bool> hasLocalData() async => _box.isNotEmpty;

  List<DestinationLocalModel> getAllRecentSearches() {
    return _box.values.toList();
  }

  Future<void> saveRecentSearches(List<DestinationLocalModel> data) async {
    for (final p in data) {
      await _box.put(p.destinationId, p);
    }
  }

  Future<void> clear() async {
    await _box.clear();
  }
}
