import 'package:project_1_flutter/Models/place_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Database {
  final supabase = Supabase.instance.client;

  Future<List<PlaceModel>> getAllPlaces() async {
    final data = await supabase.from("places").select();

    List<PlaceModel> allPlaces = [];

    for (var element in data) {
      PlaceModel course = PlaceModel.fromJson(element);
      allPlaces.add(course);
    }

    return allPlaces;
  }
}
