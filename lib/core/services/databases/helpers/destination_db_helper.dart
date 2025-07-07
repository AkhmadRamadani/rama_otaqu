
import 'package:hive_ce/hive.dart';
import 'package:rama_otaqu/core/services/databases/constants/hive_constant.dart';
import 'package:rama_otaqu/core/services/databases/hive_models/destination_local_model.dart';

class DestinationDbHelper {
  Box<DestinationLocalModel> get _box =>
      Hive.box<DestinationLocalModel>(HiveConstant.destinationBox);

  Future<bool> hasLocalData() async => _box.isNotEmpty;

  List<DestinationLocalModel> getAllDestinations() {
    return _box.values.toList();
  }

  Future<List<DestinationLocalModel>> getFilteredDestinations({
    String? nameFilter,
  }) async {
    final allDestinations = getAllDestinations();
    final filtered = _applyFilters(allDestinations, nameFilter);

    return filtered;
  }

  List<DestinationLocalModel> _applyFilters(
    List<DestinationLocalModel> destinations,
    String? nameFilter,
  ) {
    return destinations.where((item) {
      final matchesName =
          nameFilter == null ||
          (item.name?.toLowerCase() ?? '').contains(nameFilter.toLowerCase());

      return matchesName;
    }).toList();
  }

  Future<DestinationLocalModel?> getDestination(String id) async =>
      _box.get(id);

  Future<void> saveDestinations(List<DestinationLocalModel> data) async {
    for (final p in data) {
      await _box.put(p.destinationId, p);
    }
  }
}
