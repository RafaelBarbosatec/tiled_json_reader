import 'package:tiledjsonreader/map/layer/objects.dart';

class WangColor {
  String? color;
  String? name;
  double? probability;
  int? tile;
  List<Property>? properties;

  WangColor.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    name = json['name'];
    probability = json['probability'].toDouble();
    tile = json['tile'];
    if (json['properties'] != null) {
      properties = <Property>[];
      json['properties'].forEach((v) {
        properties?.add(Property.fromJson(v));
      });
    }
  }
}
