import 'dart:convert';

OnlyURLModel onlyUrlModelFromJson(String str) =>
    OnlyURLModel.fromJson(json.decode(str));

String onlyUrlModelToJson(OnlyURLModel data) => json.encode(data.toJson());

class OnlyURLModel {
  OnlyURLModel({
    required this.url,
  });

  final String url;

  factory OnlyURLModel.fromJson(Map<String, dynamic> json) => OnlyURLModel(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}
