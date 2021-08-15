import 'dart:developer';

import 'package:acme_test/appTheme/acmeTheme.dart';
import 'package:acme_test/appWidgets/labelWithIcon.dart';
import 'package:acme_test/autoCompleteBloc/AutoCompleteBloc.dart';
import 'package:acme_test/commons/dimensionsValues.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import 'package:transparent_image/transparent_image.dart';

class PlaceInfoLayoutWidget extends StatefulWidget {
  final String address;

  const PlaceInfoLayoutWidget({Key key, this.address}) : super(key: key);

  @override
  _PlaceInfoLayoutWidget createState() {
    return _PlaceInfoLayoutWidget(address: address);
  }
}

class _PlaceInfoLayoutWidget extends State<PlaceInfoLayoutWidget> {
  final String address;

  List<String> _searchResults = [];
  String _street = "27 Brookview Dr";
  String _location = "North York, ON M6A 2K4";

  _PlaceInfoLayoutWidget({this.address});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(),
          margin: EdgeInsets.all(0),
          child: Column(
            children: [
              _buildHeader(),
              _buildIconBar(context),
              Divider(),
              _buildAddMissingPlace(),
              _buildAddAlabelSection(),
              _buildNetworkImage()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNetworkImage() {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
      height: MediaQuery.of(context).size.height / 6,
      child: FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          fit: BoxFit.fitWidth,
          image:
              "https://imgix.bustle.com/inverse/76/2a/f0/dc/d557/45a8/b40a/f03447092214/cihkfvveaa8fxijpg-largejpeg.jpeg?w=2000&h=640&fit=crop&crop=faces&auto=format%2Ccompress&q=50&dpr=2"),
    );
  }

  Row _buildAddAlabelSection() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Icon(Icons.flag, color: Colors.blue[300]),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Add a label",
            style: AcmeAppTheme.themeDataLight.textTheme.bodyText1,
          ),
        )
      ],
    );
  }

  Widget _buildAddMissingPlace() {
    return GestureDetector(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child:
                Icon(Icons.add_location_alt_outlined, color: Colors.blue[300]),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Add a missing place",
              style: AcmeAppTheme.themeDataLight.textTheme.bodyText1,
            ),
          )
        ],
      ),
      onTap: () {},
    );
  }

  Row _buildIconBar(BuildContext context) {
    return Row(
      children: [
        // Spacer(),
        Expanded(
          child: Padding(
            padding: defaultIconPadding,
            child: Icon(
              Icons.star,
              color: Colors.blue[300],
              size: GetDimensions.getIconSizeByBuildContext(context),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: defaultIconPadding,
            child: Icon(
              Icons.location_on_outlined,
              color: Colors.blue[300],
              size: GetDimensions.getIconSizeByBuildContext(context),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: defaultIconPadding,
            child: Icon(
              Icons.phone_android_rounded,
              color: Colors.blue[300],
              size: GetDimensions.getIconSizeByBuildContext(context),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: defaultIconPadding,
            child: Icon(
              Icons.share,
              color: Colors.blue[300],
              size: GetDimensions.getIconSizeByBuildContext(context),
            ),
          ),
        ),
        // Spacer(),
      ],
    );
  }

  IntrinsicHeight _buildHeader() => IntrinsicHeight(
          child: Stack(
        children: [
          _buildImageAndImageFooter(),
          _buildSearchField(),
          _buildFloatingButton()
        ],
      ));

  Widget _buildFloatingButton() {
    return Positioned(
      top: MediaQuery.of(context).size.height * 3 / 10 - 35,
      left: MediaQuery.of(context).size.width * 2 / 6 - 60,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          direction: Axis.vertical,
          children: [
            FloatingActionButton(
              mini: true,
              child: Icon(
                Icons.directions,
                color: Colors.blue[500],
              ),
              backgroundColor: Colors.white,
            ),
            Text(
              "Directions",
              style: AcmeAppTheme.themeDataLight.textTheme.bodyText1
                  .copyWith(color: Colors.white, fontSize: 10),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildImageAndImageFooter() {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height * 3 / 10,
              child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  fit: BoxFit.cover,
                  image:
                      "https://imgix.bustle.com/inverse/76/2a/f0/dc/d557/45a8/b40a/f03447092214/cihkfvveaa8fxijpg-largejpeg.jpeg?w=2000&h=640&fit=crop&crop=faces&auto=format%2Ccompress&q=50&dpr=2"),
            ),
          ),
          Container(
            color: Colors.blue[500],
            child: ListTile(
              title: Text(
                _street,
                style: AcmeAppTheme.themeDataLight.textTheme.bodyText1
                    .copyWith(color: Colors.white),
              ),
              subtitle: Text(
                _location,
                style: AcmeAppTheme.themeDataLight.textTheme.bodyText1
                    .copyWith(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 50,
        color: Colors.white,
        child: Column(
          children: [
            TextField(
              textAlignVertical: TextAlignVertical.center,
              style: AcmeAppTheme.themeDataLight.textTheme.bodyText1,
              decoration: InputDecoration(
                  hintText: "Search Location",
                  prefixIcon: Icon(
                    Icons.menu,
                    color: Colors.black54,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.clear,
                      color: Colors.black12,
                    ),
                    onPressed: () {
                      primaryFocus.unfocus();
                    },
                  )),
              onChanged: (value) {
                setState(() {

                });
              },
            ),

          ],
        ),
      ),
    );
  }
}
