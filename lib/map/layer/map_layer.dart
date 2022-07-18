import 'package:tiledjsonreader/map/layer/objects.dart';
import 'package:tiledjsonreader/map/layer/type_layer.dart';
import 'package:tiledjsonreader/util/extensions.dart';

class MapLayer {
  int? id;
  String? name;
  bool? visible;
  double? x;
  double? y;
  double? offsetX;
  double? offsetY;
  TypeLayer? type;
  double? opacity;
  List<Property>? properties;

  MapLayer(
      {this.id,
      this.name,
      this.type,
      this.visible,
      this.x,
      this.y,
      this.opacity});

  MapLayer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    offsetX = double.tryParse(json['offsetx'].toString()) ?? 0.0;
    offsetY = double.tryParse(json['offsety'].toString()) ?? 0.0;
    opacity = double.tryParse(json['opacity'].toString()) ?? 0.0;
    type = json['type'].toString().getTypeLayer();
    visible = json['visible'];
    x = double.tryParse(json['x'].toString()) ?? 0.0;
    y = double.tryParse(json['y'].toString()) ?? 0.0;
    if (json['properties'] != null) {
      properties = <Property>[];
      json['properties'].forEach((v) {
        properties?.add(new Property.fromJson(v));
      });
    }
  }

  void setParamsFromJson(Map<String, dynamic> json) {
    final mapLayer = MapLayer.fromJson(json);
    id = mapLayer.id;
    name = mapLayer.name;
    offsetX = mapLayer.offsetX;
    offsetY = mapLayer.offsetY;
    opacity = mapLayer.opacity;
    type = mapLayer.type;
    visible = mapLayer.visible;
    x = mapLayer.x;
    y = mapLayer.y;
    properties = mapLayer.properties;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type?.getName();
    data['visible'] = this.visible;
    data['x'] = this.x;
    data['y'] = this.y;
    if (this.properties != null) {
      data['properties'] = this.properties?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
