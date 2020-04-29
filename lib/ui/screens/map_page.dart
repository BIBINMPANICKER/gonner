import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gonner/manager/map_manager.dart';
import 'package:gonner/models/map/map_model.dart';
import 'package:gonner/models/tool_tip/tool_tip_model.dart';
import 'package:gonner/ui/widgets/tool_tip.dart';
import 'package:gonner/utils/map_config.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = Set<Marker>();
  double pinPillPosition = -100;
  PinInformation currentlySelectedPin =
      PinInformation(locationName: '', location: LatLng(0, 0));

  @override
  void initState() {
    mapBloc.getMapCoordinates().then((res) {
      setState(() {
        setMapPins(res);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      //map widget
      GoogleMap(
        compassEnabled: true,
        markers: _markers,
        mapType: MapType.normal,
        initialCameraPosition: MapConfig.setInitialLocation(),
        onMapCreated: onMapCreated,
        onTap: (LatLng location) {
          setState(() {
            pinPillPosition = -100;
          });
        },
      ),
      //tooltip widget
      ToolTip(
          pinPillPosition: pinPillPosition,
          currentlySelectedPin: currentlySelectedPin)
    ]));
  }

  //when map created
  void onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  //setting markers according to the co-ordinates
  void setMapPins(MapModel res) {
    for (int i = 0; i < res.data.length; i++) {
      _markers.add(Marker(

          // This marker id can be anything that uniquely identifies each marker.
          markerId: MarkerId(i.toString()),
          position:
              LatLng(res.data[i].coordinates[1], res.data[i].coordinates[0]),
          onTap: () {
            setState(() {
              currentlySelectedPin = PinInformation(
                  locationName: res.data[i].properties.message,
                  location: LatLng(
                      res.data[i].coordinates[1], res.data[i].coordinates[0]));
              pinPillPosition = 0;
            });
          },
          icon: MapConfig.bitmapDescriptor(res.data[i].properties.color)));
    }
  }
}
