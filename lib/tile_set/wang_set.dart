import 'package:tiledjsonreader/map/layer/objects.dart';
import 'package:tiledjsonreader/tile_set/wang_color.dart';

class WangSet {
  String? name;
  List<WangColor>? colors;
  List<Property>? properties;
  int? tile;

  WangSet.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    tile = json['tile'];
    if (json['colors'] != null) {
      colors = [];
      json['colors'].forEach((v) {
        colors?.add(WangColor.fromJson(v));
      });
    }
    if (json['properties'] != null) {
      properties = [];
      json['properties'].forEach((v) {
        properties?.add(Property.fromJson(v));
      });
    }
  }
}
