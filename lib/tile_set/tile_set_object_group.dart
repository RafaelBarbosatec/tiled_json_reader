import 'package:tiledjsonreader/tile_set/tile_set_object.dart';

class TileSetObjectGroup {
  String drawOrder;
  int id;
  String name;
  List<TileSetObject> objects;
  int opacity;
  String type;
  bool visible;
  int x;
  int y;

  TileSetObjectGroup(
      {this.drawOrder,
      this.id,
      this.name,
      this.objects,
      this.opacity,
      this.type,
      this.visible,
      this.x,
      this.y});

  TileSetObjectGroup.fromJson(Map<String, dynamic> json) {
    drawOrder = json['draworder'];
    id = json['id'];
    name = json['name'];
    if (json['objects'] != null) {
      objects = new List<TileSetObject>();
      json['objects'].forEach((v) {
        objects.add(new TileSetObject.fromJson(v));
      });
    }
    opacity = json['opacity'];
    type = json['type'];
    visible = json['visible'];
    x = json['x'];
    y = json['y'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['draworder'] = this.drawOrder;
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.objects != null) {
      data['objects'] = this.objects.map((v) => v.toJson()).toList();
    }
    data['opacity'] = this.opacity;
    data['type'] = this.type;
    data['visible'] = this.visible;
    data['x'] = this.x;
    data['y'] = this.y;
    return data;
  }
}
