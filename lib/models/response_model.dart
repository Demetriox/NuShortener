import 'dart:convert';

ResponseModel responseModelFromJson(String str) =>
    ResponseModel.fromJson(json.decode(str));

String responseModelToJson(ResponseModel data) => json.encode(data.toJson());

class ResponseModel<T> {
  T? model;

  ResponseModel({
    this.model,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        model: json["Model"],
      );

  Map<String, dynamic> toJson() => {
        "Model": model,
      };
}
