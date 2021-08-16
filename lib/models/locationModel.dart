class LocationModel {
  final double lat;
  final double long;

  LocationModel({this.lat, this.long});

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        lat: json['lat'],
        long: json['lng'],
      );
}
