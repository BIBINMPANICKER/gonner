// To parse this JSON data, do
//
//     final mapModel = mapModelFromJson(jsonString);

import 'dart:convert';

class MapModel {
  final List<Datum> data;

  MapModel({
    this.data,
  });

  factory MapModel.fromJson(String str) => MapModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MapModel.fromMap(Map<String, dynamic> json) => MapModel(
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toMap())),
  };
}

class Datum {
  final List<double> coordinates;
  final Properties properties;

  Datum({
    this.coordinates,
    this.properties,
  });

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    coordinates: json["coordinates"] == null ? null : List<double>.from(json["coordinates"].map((x) => x.toDouble())),
    properties: json["properties"] == null ? null : Properties.fromMap(json["properties"]),
  );

  Map<String, dynamic> toMap() => {
    "coordinates": coordinates == null ? null : List<dynamic>.from(coordinates.map((x) => x)),
    "properties": properties == null ? null : properties.toMap(),
  };
}

class Properties {
  final String color;
  final String message;

  Properties({
    this.color,
    this.message,
  });

  factory Properties.fromJson(String str) => Properties.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Properties.fromMap(Map<String, dynamic> json) => Properties(
    color: json["color"] == null ? null : json["color"],
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toMap() => {
    "color": color == null ? null : colorValues.reverse[color],
    "message": message == null ? null : message,
  };
}

enum Color { ORANGE, BLUE, RED }

final colorValues = EnumValues({
  "blue": Color.BLUE,
  "orange": Color.ORANGE,
  "red": Color.RED
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
