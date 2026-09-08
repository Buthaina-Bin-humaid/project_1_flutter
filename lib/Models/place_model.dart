class PlaceModel {
  final String name;
  final String description;
  final String image;

  PlaceModel({
    required this.name,
    required this.description,
    required this.image,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      name: json["name"],
      description: json["description"],
      image: json["image"],
    );
  }
}
