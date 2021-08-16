import 'package:acme_test/models/locationModel.dart';

class Geometry {
  final LocationModel location;

  Geometry({this.location});

  factory Geometry.fromJson(Map<String, dynamic> json) =>
      Geometry(location: LocationModel.fromJson(json["location"]));
}
