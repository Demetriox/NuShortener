class LinkModel {
  LinkModel({
    required this.self,
    required this.short,
  });

  final String self;
  final String short;

  factory LinkModel.fromJson(Map<String, dynamic> json) => LinkModel(
        self: json["self"],
        short: json["short"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
        "short": short,
      };
}
