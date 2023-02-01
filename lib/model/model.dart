import 'dart:convert';

List<Welcome> welcomeFromJson(String str) =>
    List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  Welcome({
    this.country,
    this.slug,
    this.iso2,
  });

  String? country;
  String? slug;
  String? iso2;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        country: json["Country"],
        slug: json["Slug"],
        iso2: json["ISO2"],
      );

  Map<String, dynamic> toJson() => {
        "Country": country,
        "Slug": slug,
        "ISO2": iso2,
      };
}
