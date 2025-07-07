// To parse this JSON data, do
//
//     final listAvailResponseModel = listAvailResponseModelFromJson(jsonString);

import 'dart:convert';

ListAvailResponseModel listAvailResponseModelFromJson(String str) =>
    ListAvailResponseModel.fromJson(json.decode(str));

String listAvailResponseModelToJson(ListAvailResponseModel data) =>
    json.encode(data.toJson());

class ListAvailResponseModel {
  int? code;
  bool? status;
  String? message;
  Data? data;

  ListAvailResponseModel({this.code, this.status, this.message, this.data});

  ListAvailResponseModel copyWith({
    int? code,
    bool? status,
    String? message,
    Data? data,
  }) => ListAvailResponseModel(
    code: code ?? this.code,
    status: status ?? this.status,
    message: message ?? this.message,
    data: data ?? this.data,
  );

  factory ListAvailResponseModel.fromJson(Map<String, dynamic> json) =>
      ListAvailResponseModel(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
    "code": code,
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  int? totalPage;
  int? currentPage;
  int? totalPackage;
  List<Package>? packages;

  Data({this.totalPage, this.currentPage, this.totalPackage, this.packages});

  Data copyWith({
    int? totalPage,
    int? currentPage,
    int? totalPackage,
    List<Package>? packages,
  }) => Data(
    totalPage: totalPage ?? this.totalPage,
    currentPage: currentPage ?? this.currentPage,
    totalPackage: totalPackage ?? this.totalPackage,
    packages: packages ?? this.packages,
  );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    totalPage: json["total_page"],
    currentPage: json["current_page"],
    totalPackage: json["total_package"],
    packages:
        json["packages"] == null
            ? []
            : List<Package>.from(
              json["packages"]!.map((x) => Package.fromJson(x)),
            ),
  );

  Map<String, dynamic> toJson() => {
    "total_page": totalPage,
    "current_page": currentPage,
    "total_package": totalPackage,
    "packages":
        packages == null
            ? []
            : List<dynamic>.from(packages!.map((x) => x.toJson())),
  };
}

class Package {
  int? packageId;
  String? name;
  int? price;
  String? currency;
  int? day;
  String? operationTimeIn;
  String? operationTimeOut;
  String? timeZone;
  List<String>? images;
  int? packageTypeId;
  String? packageTypeName;
  bool? isInstallment;
  List<Destination>? destinations;

  Package({
    this.packageId,
    this.name,
    this.price,
    this.currency,
    this.day,
    this.operationTimeIn,
    this.operationTimeOut,
    this.timeZone,
    this.images,
    this.packageTypeId,
    this.packageTypeName,
    this.isInstallment,
    this.destinations,
  });

  Package copyWith({
    int? packageId,
    String? name,
    int? price,
    String? currency,
    int? day,
    String? operationTimeIn,
    String? operationTimeOut,
    String? timeZone,
    List<String>? images,
    int? packageTypeId,
    String? packageTypeName,
    bool? isInstallment,
    List<Destination>? destinations,
  }) => Package(
    packageId: packageId ?? this.packageId,
    name: name ?? this.name,
    price: price ?? this.price,
    currency: currency ?? this.currency,
    day: day ?? this.day,
    operationTimeIn: operationTimeIn ?? this.operationTimeIn,
    operationTimeOut: operationTimeOut ?? this.operationTimeOut,
    timeZone: timeZone ?? this.timeZone,
    images: images ?? this.images,
    packageTypeId: packageTypeId ?? this.packageTypeId,
    packageTypeName: packageTypeName ?? this.packageTypeName,
    isInstallment: isInstallment ?? this.isInstallment,
    destinations: destinations ?? this.destinations,
  );

  factory Package.fromJson(Map<String, dynamic> json) => Package(
    packageId: json["package_id"],
    name: json["name"],
    price: json["price"],
    currency: json["currency"],
    day: json["day"],
    operationTimeIn: json["operation_time_in"],
    operationTimeOut: json["operation_time_out"],
    timeZone: json["time_zone"],
    images:
        json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
    packageTypeId: json["package_type_id"],
    packageTypeName: json["package_type_name"],
    isInstallment: json["is_installment"],
    destinations:
        json["destinations"] == null
            ? []
            : List<Destination>.from(
              json["destinations"]!.map((x) => Destination.fromJson(x)),
            ),
  );

  Map<String, dynamic> toJson() => {
    "package_id": packageId,
    "name": name,
    "price": price,
    "currency": currency,
    "day": day,
    "operation_time_in": operationTimeIn,
    "operation_time_out": operationTimeOut,
    "time_zone": timeZone,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
    "package_type_id": packageTypeId,
    "package_type_name": packageTypeName,
    "is_installment": isInstallment,
    "destinations":
        destinations == null
            ? []
            : List<dynamic>.from(destinations!.map((x) => x.toJson())),
  };
}

class Destination {
  int? destinationId;
  String? name;

  Destination({this.destinationId, this.name});

  Destination copyWith({int? destinationId, String? name}) => Destination(
    destinationId: destinationId ?? this.destinationId,
    name: name ?? this.name,
  );

  factory Destination.fromJson(Map<String, dynamic> json) =>
      Destination(destinationId: json["destination_id"], name: json["name"]);

  Map<String, dynamic> toJson() => {
    "destination_id": destinationId,
    "name": name,
  };
}
