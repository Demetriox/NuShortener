// To parse this JSON data, do
//
//     final urlInformation = urlInformationFromJson(jsonString);

import 'dart:convert';

import 'package:shortener_nu/models/link_model.dart';

URLInfoModel urlInformationFromJson(String str) =>
    URLInfoModel.fromJson(json.decode(str));

String urlInformationToJson(URLInfoModel data) => json.encode(data.toJson());

class URLInfoModel {
  URLInfoModel({
    required this.alias,
    required this.links,
  });

  final String alias;
  final LinkModel links;

  factory URLInfoModel.fromJson(Map<String, dynamic> json) => URLInfoModel(
        alias: json["alias"],
        links: LinkModel.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "alias": alias,
        "_links": links.toJson(),
      };
}
