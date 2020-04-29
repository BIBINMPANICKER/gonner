import 'package:gonner/models/map/map_model.dart';
import 'package:gonner/resources/api_providers/map_api_provider.dart';

class Repository {
  final restaurantApiProvider = RestaurantApiProvider();

// fetch the map co-ordinates and its details
  Future<MapModel> getMapCoordinates() =>
      restaurantApiProvider.getMapCoordinates();
}
