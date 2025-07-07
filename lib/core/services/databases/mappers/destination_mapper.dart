import 'package:rama_otaqu/core/services/databases/hive_models/destination_local_model.dart';
import 'package:rama_otaqu/core/shared/models/destination_entity_model.dart';
import 'package:rama_otaqu/modules/home/models/destination_response_model.dart';

class DestinationMapper {
  List<DestinationLocalModel> networkToLocal(
    List<DestinationNetworkModel> data,
  ) {
    return data.map((e) => e.toDestinationLocalModel()).toList();
  }

  List<DestinationNetworkModel> localToNetwork(
    List<DestinationLocalModel> data,
  ) {
    return data.map((e) => e.toDestinationNetworkModel()).toList();
  }

  List<DestinationEntityModel> networkToEntity(
    List<DestinationNetworkModel> data,
  ) {
    return data.map((e) => e.toEntity()).toList();
  }

  List<DestinationEntityModel> localToEntity(List<DestinationLocalModel> data) {
    return data.map((e) => e.toEntity()).toList();
  }

  List<DestinationLocalModel> entityToLocal(List<DestinationEntityModel> data) {
    return data.map((e) => e.toDestinationLocalModel()).toList();
  }

  List<DestinationNetworkModel> entityToNetwork(List<DestinationEntityModel> data) {
    return data.map((e) => e.toDestinationNetworkModel()).toList();
  }
}
