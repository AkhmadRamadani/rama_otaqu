import 'dart:convert';

import 'package:rama_otaqu/core/services/databases/hive_models/destination_local_model.dart';
import 'package:rama_otaqu/core/shared/models/destination_entity_model.dart';

BaseDestinationResponseModel destinationResponseModelFromJson(String str) =>
    BaseDestinationResponseModel.fromJson(json.decode(str));

String destinationResponseModelToJson(BaseDestinationResponseModel data) =>
    json.encode(data.toJson());

class BaseDestinationResponseModel {
  int? code;
  bool? status;
  String? message;
  List<DestinationNetworkModel>? data;

  BaseDestinationResponseModel({
    this.code,
    this.status,
    this.message,
    this.data,
  });

  factory BaseDestinationResponseModel.fromJson(Map<String, dynamic> json) =>
      BaseDestinationResponseModel(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        data:
            json["data"] == null
                ? []
                : List<DestinationNetworkModel>.from(
                  json["data"]!.map((x) => DestinationNetworkModel.fromJson(x)),
                ),
      );

  Map<String, dynamic> toJson() => {
    "code": code,
    "status": status,
    "message": message,
    "data":
        data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class DestinationNetworkModel {
  int? destinationId;
  String? typeSource;
  String? typeName;
  String? name;
  int? packageTypeId;

  DestinationNetworkModel({
    this.destinationId,
    this.typeSource,
    this.typeName,
    this.name,
    this.packageTypeId,
  });

  factory DestinationNetworkModel.fromJson(Map<String, dynamic> json) =>
      DestinationNetworkModel(
        destinationId: json["destination_id"],
        typeSource: json["type_source"],
        typeName: json["type_name"],
        name: json["name"],
        packageTypeId: json["package_type_id"],
      );

  Map<String, dynamic> toJson() => {
    "destination_id": destinationId,
    "type_source": typeSource,
    "type_name": typeName,
    "name": name,
    "package_type_id": packageTypeId,
  };
}

extension DestinationModelIsolated on DestinationNetworkModel {
  DestinationLocalModel toDestinationLocalModel() => DestinationLocalModel(
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
