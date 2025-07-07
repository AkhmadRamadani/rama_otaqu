import 'package:rama_otaqu/core/services/databases/hive_models/destination_local_model.dart';
import 'package:rama_otaqu/modules/home/models/destination_response_model.dart';

class DestinationEntityModel {
  final int? destinationId;
  final String? typeSource;
  final String? typeName;
  final String? name;

  DestinationEntityModel({
    this.destinationId,
    this.typeSource,
    this.typeName,
    this.name,
  });

  DestinationEntityModel copyWith({
    int? destinationId,
    String? typeSource,
    String? typeName,
    String? name,
  }) {
    return DestinationEntityModel(
      destinationId: destinationId ?? this.destinationId,
      typeSource: typeSource ?? this.typeSource,
      typeName: typeName ?? this.typeName,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'destinationId': destinationId,
      'typeSource': typeSource,
      'typeName': typeName,
      'name': name,
    };
  }
}

extension DestinationEntityModelIsolated on DestinationEntityModel {
  DestinationLocalModel toDestinationLocalModel() => DestinationLocalModel(
    destinationId: destinationId,
    typeSource: typeSource,
    typeName: typeName,
    name: name,
  );

  DestinationNetworkModel toDestinationNetworkModel() =>
      DestinationNetworkModel(
        destinationId: destinationId,
        typeSource: typeSource,
        typeName: typeName,
        name: name,
      );
}
