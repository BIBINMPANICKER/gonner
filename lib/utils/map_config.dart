import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapConfig {
  static const double CAMERA_ZOOM = 0;
  static const double CAMERA_TILT = 0;
  static const double CAMERA_BEARING = 30;

  //initializing camera position
  static setInitialLocation() {
    CameraPosition _initialLocation = CameraPosition(
        zoom: MapConfig.CAMERA_ZOOM,
        bearing: MapConfig.CAMERA_BEARING,
        tilt: MapConfig.CAMERA_TILT,
        target: LatLng(0, 0));

    return _initialLocation;
  }

  // marker color based on properties of co-ordinates
  static bitmapDescriptor(String color) {
    var hue;
    switch (color) {
      case 'green':
        hue = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen);
        break;
      case 'red':
        hue = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed);
        break;
      case 'blue':
        hue = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue);
        break;
      case 'orange':
        hue = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange);
        break;
      default:
        hue = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow);
        break;
    }
    return hue;
  }
}
