// To parse this JSON data, do
//
//     final destinationLocalModel = destinationLocalModelFromJson(jsonString);

import 'package:hive_ce/hive.dart';
import 'package:rama_otaqu/core/shared/models/destination_entity_model.dart';
import 'dart:convert';

import 'package:rama_otaqu/modules/home/models/destination_response_model.dart';

part 'destination_local_model.g.dart';

DestinationLocalModel destinationLocalModelFromJson(String str) =>
    DestinationLocalModel.fromJson(json.decode(str));

String destinationLocalModelToJson(DestinationLocalModel data) =>
    json.encode(data.toJson());

@HiveType(typeId: 1)
class DestinationLocalModel {
  @HiveField(1)
  int? destinationId;
  @HiveField(2)
  String? typeSource;
  @HiveField(3)
  String? typeName;
  @HiveField(4)
  String? name;

  DestinationLocalModel({
    this.destinationId,
    this.typeSource,
    this.typeName,
    this.name,
  });

  DestinationLocalModel copyWith({
    int? destinationId,
    String? typeSource,
    String? typeName,
    String? name,
  }) => DestinationLocalModel(
    destinationId: destinationId ?? this.destinationId,
    typeSource: typeSource ?? this.typeSource,
    typeName: typeName ?? this.typeName,
    name: name ?? this.name,
  );

  factory DestinationLocalModel.fromJson(Map<String, dynamic> json) =>
      DestinationLocalModel(
        destinationId: json["destination_id"],
        typeSource: json["type_source"],
        typeName: json["type_name"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
    "destination_id": destinationId,
    "type_source": typeSource,
    "type_name": typeName,
    "name": name,
  };
}

extension DestinationLocalModelIsolated on DestinationLocalModel {
  DestinationNetworkModel toDestinationNetworkModel() =>
      DestinationNetworkModel(
        destinationId: destinationId,
        typeSource: typeSource,
        typeName: typeName,
        name: name,
      );

  DestinationEntityModel toEntity() => DestinationEntityModel(
    destinationId: destinationId,
    typeSource: typeSource,
    typeName: typeName,
    name: name,
  );
}
