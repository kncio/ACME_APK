import 'package:acme_test/models/geometryModel.dart';

class PlaceModel {
  final String name;
  final String vicinity;
  final Geometry geometry;

  PlaceModel({this.name, this.vicinity, this.geometry});

  factory PlaceModel.fromJson(Map<String, dynamic> json) => PlaceModel(
      name: json["formatted_address"],
      vicinity: json["vicinity"],
      geometry: Geometry.fromJson(json["geometry"]));
}
