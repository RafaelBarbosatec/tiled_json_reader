import 'package:tiledjsonreader/tile_set/polygon.dart';

class TileSetObject {
  bool? ellipse;
  int? gid;
  double? height;
  double? width;
  int? id;
  String? name;
  List<Polygon>? polygon;
  List<Polygon>? polyline;
  double? rotation;
  String? type;
  bool? visible;
  double? x;
  double? y;
  bool? point;

  TileSetObject({
    this.ellipse,
    this.height,
    this.id,
    this.name,
    this.polygon,
    this.rotation,
    this.type,
    this.visible,
    this.width,
    this.x,
    this.y,
  });

  TileSetObject.fromJson(Map<String, dynamic> json) {
    ellipse = json['ellipse'] ?? false;
    height = double.parse(json['height'].toString());
    width = double.parse(json['width'].toString());
    id = json['id'];
    gid = json['gid'];
    name = json['name'];
    point = json['point'];
    if (json['polygon'] != null) {
      polygon = <Polygon>[];
      json['polygon'].forEach((v) {
        polygon?.add(Polygon.fromJson(v));
      });
    }
    if (json['polyline'] != null) {
      polyline = <Polygon>[];
      json['polyline'].forEach((v) {
        polyline?.add(Polygon.fromJson(v));
      });
    }
    rotation = double.parse(json['rotation'].toString());
    type = json['type'];
    visible = json['visible'];
    x = double.parse(json['x'].toString());
    y = double.parse(json['y'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['ellipse'] = this.ellipse;
    data['height'] = this.height;
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.polygon != null) {
      data['polygon'] = this.polygon?.map((v) => v.toJson()).toList();
    }
    if (this.polyline != null) {
      data['polyline'] = this.polyline?.map((v) => v.toJson()).toList();
    }
    data['rotation'] = this.rotation;
    data['type'] = this.type;
    data['visible'] = this.visible;
    data['width'] = this.width;
    data['x'] = this.x;
    data['y'] = this.y;
    return data;
  }
}
