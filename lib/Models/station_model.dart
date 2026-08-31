import 'package:flutter/material.dart';

class StationModel {
  final String name;
  final String image;
  final String line;
  final String destinations;
  final Color color;

  StationModel({
    required this.name,
    required this.image,
    required this.line,
    required this.destinations,
    required this.color,
  });

  factory StationModel.fromJson(Map<String, dynamic> json) {
    return StationModel(
      name: json["name"],
      image: json["image"],
      line: json["line"],
      destinations: json["destinations"],
      color: Color(json["color"]),
    );
  }
}