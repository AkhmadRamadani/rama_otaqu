import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:rama_otaqu/core/services/databases/constants/hive_constant.dart';
import 'package:rama_otaqu/core/services/databases/hive_models/destination_local_model.dart';

class LocalDb {
  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(DestinationLocalModelAdapter());

    await Hive.openBox<String>(HiveConstant.stringBox);
    await Hive.openBox<bool>(HiveConstant.boolBox);
    await Hive.openBox<DestinationLocalModel>(HiveConstant.destinationBox);
    await Hive.openBox<DestinationLocalModel>(HiveConstant.recentSearchBox);
  }
}
