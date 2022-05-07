import 'dart:convert';

ErrorModel errorFromJson(String str) => ErrorModel.fromJson(json.decode(str));

String errorToJson(ErrorModel data) => json.encode(data.toJson());

class ErrorModel {
  ErrorModel({
    required this.error,
  });

  final String error;

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
      };
}
