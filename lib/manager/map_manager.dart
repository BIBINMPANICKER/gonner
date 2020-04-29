import 'dart:async';

import 'package:gonner/models/map/map_model.dart';
import 'package:gonner/utils/object_factory.dart';

class MapBloc {
// fetch the map co-ordinates and its details
  Future<MapModel> getMapCoordinates() async {
    final restaurantResponse =
        await ObjectFactory().repository.getMapCoordinates();
    return restaurantResponse;
  }
}

final mapBloc = MapBloc();
