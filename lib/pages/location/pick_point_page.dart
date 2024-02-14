import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import '../../utils/key.dart';

class PickPointPage extends StatelessWidget {
  static const kInitialPosition = LatLng(37.785591, -122.406331);

  final void Function(PickResult)? onPlacePicked;
  const PickPointPage({Key? key, this.onPlacePicked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: PlacePicker(
          resizeToAvoidBottomInset:
              false, // only works on fullscreen, less flickery
          apiKey: apiKey,
          hintText: "Search",
          searchingText: "Please wait ...",
          selectText: "Select place",
          outsideOfPickAreaText: "Place not in area",
          initialPosition: PickPointPage.kInitialPosition,
          useCurrentLocation: true,
          selectInitialPosition: true,
          usePinPointingSearch: true,
          usePlaceDetailSearch: true,
          zoomGesturesEnabled: true,
          zoomControlsEnabled: false,
          onMapCreated: (controller) {
            log("Map created");
          },
          onPlacePicked: onPlacePicked,
          enableMapTypeButton: false,
          enableMyLocationButton: false,

          // (PickResult result) {
          //   log("Place picked: ${result.formattedAddress}");
          //   setState(() {
          //     selectedPlace = result;
          //     pickText = selectedPlace!.formattedAddress.toString();
          //     Navigator.of(context).pop();
          //   });
          // },
          onMapTypeChanged: (mapType) {
            log("Map type changed to ${mapType.toString()}");
          },
        ),
      ),
    );
  }
}
