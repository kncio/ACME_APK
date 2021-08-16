import 'package:acme_test/commons/stringsValues.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:acme_test/models/PlaceDetailsModel.dart';

class GPlacesService {
  final key = '$g_key';

  Future<PlaceModel> getPlaceByPlaceId(String placeId) async {
    var urlString =
        "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key";
    var url = Uri.dataFromString("");

    var response = await http.get(url);

    var jsonObject = convert.jsonDecode(response.body);

    var json = jsonObject["result"] as Map<String, dynamic>;

    return PlaceModel.fromJson(json);
  }
}
