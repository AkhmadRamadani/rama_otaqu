import 'dart:convert';

AuthResponseModel authResponseModelFromJson(String str) =>
    AuthResponseModel.fromJson(json.decode(str));

String authResponseModelToJson(AuthResponseModel data) =>
    json.encode(data.toJson());

class AuthResponseModel {
  int? code;
  bool? success;
  String? message;
  AuthData? data;

  AuthResponseModel({this.code, this.success, this.message, this.data});

  AuthResponseModel copyWith({
    int? code,
    bool? success,
    String? message,
    AuthData? data,
  }) => AuthResponseModel(
    code: code ?? this.code,
    success: success ?? this.success,
    message: message ?? this.message,
    data: data ?? this.data,
  );

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      AuthResponseModel(
        code: json["code"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : AuthData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
    "code": code,
    "success": success,
    "message": message,
    "data": data?.toJson(),
  };
}

class AuthData {
  String? accessToken;
  String? tokenType;
  int? expiresIn;

  AuthData({this.accessToken, this.tokenType, this.expiresIn});

  AuthData copyWith({String? accessToken, String? tokenType, int? expiresIn}) =>
      AuthData(
        accessToken: accessToken ?? this.accessToken,
        tokenType: tokenType ?? this.tokenType,
        expiresIn: expiresIn ?? this.expiresIn,
      );

  factory AuthData.fromJson(Map<String, dynamic> json) => AuthData(
    accessToken: json["access_token"],
    tokenType: json["token_type"],
    expiresIn: json["expires_in"],
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
    "token_type": tokenType,
    "expires_in": expiresIn,
  };
}
