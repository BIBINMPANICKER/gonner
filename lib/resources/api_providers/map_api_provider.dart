import 'package:gonner/models/map/map_model.dart';
import 'package:gonner/utils/object_factory.dart';

class RestaurantApiProvider {
  //fetch co-ordinates details and bifurcate based on status code
  Future<MapModel> getMapCoordinates() async {
    final response = await ObjectFactory().apiClient.getMapCoordinates();

    if (response.statusCode == 200) {
      return MapModel.fromMap(response.data);
    } else {
      return null;
    }
  }
}
