// To parse this JSON data, do
//
//     final rickMorty = rickMortyFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'post_models.g.dart';

RickMorty rickMortyFromJson(String str) => RickMorty.fromJson(json.decode(str));

String rickMortyToJson(RickMorty data) => json.encode(data.toJson());

@JsonSerializable()
class RickMorty {
  @JsonKey(name: "info")
  final Info info;
  @JsonKey(name: "results")
  final List<Result> results;

  RickMorty({required this.info, required this.results});

  factory RickMorty.fromJson(Map<String, dynamic> json) =>
      _$RickMortyFromJson(json);

  Map<String, dynamic> toJson() => _$RickMortyToJson(this);
}

@JsonSerializable()
class Info {
  @JsonKey(name: "count")
  final int count;
  @JsonKey(name: "pages")
  final int pages;
  @JsonKey(name: "next")
  final String next;
  @JsonKey(name: "prev")
  final dynamic prev;

  Info({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);

  Map<String, dynamic> toJson() => _$InfoToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "status")
  final Status status;
  @JsonKey(name: "species")
  final Species species;
  @JsonKey(name: "type")
  final String type;
  @JsonKey(name: "gender")
  final Gender gender;
  @JsonKey(name: "origin")
  final Location origin;
  @JsonKey(name: "location")
  final Location location;
  @JsonKey(name: "image")
  final String image;
  @JsonKey(name: "episode")
  final List<String> episode;
  @JsonKey(name: "url")
  final String url;
  @JsonKey(name: "created")
  final DateTime created;

  Result({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

enum Gender {
  @JsonValue("Female")
  FEMALE,
  @JsonValue("Male")
  MALE,
  @JsonValue("unknown")
  UNKNOWN,
}

final genderValues = EnumValues({
  "Female": Gender.FEMALE,
  "Male": Gender.MALE,
  "unknown": Gender.UNKNOWN,
});

@JsonSerializable()
class Location {
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "url")
  final String url;

  Location({required this.name, required this.url});

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

enum Species {
  @JsonValue("Alien")
  ALIEN,
  @JsonValue("Human")
  HUMAN,
}

final speciesValues = EnumValues({
  "Alien": Species.ALIEN,
  "Human": Species.HUMAN,
});

enum Status {
  @JsonValue("Alive")
  ALIVE,
  @JsonValue("Dead")
  DEAD,
  @JsonValue("unknown")
  UNKNOWN,
}

final statusValues = EnumValues({
  "Alive": Status.ALIVE,
  "Dead": Status.DEAD,
  "unknown": Status.UNKNOWN,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
