class AutoCompleteInfoModel {
  final String placeId;
  final String description;

  AutoCompleteInfoModel({this.placeId, this.description});

  factory AutoCompleteInfoModel.fromMap(Map<String, dynamic> json) =>
      AutoCompleteInfoModel(
          placeId: json["place_id"], description: json["description"]);
}
