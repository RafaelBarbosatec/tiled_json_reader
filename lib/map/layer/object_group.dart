import 'package:tiledjsonreader/map/layer/map_layer.dart';
import 'package:tiledjsonreader/map/layer/objects.dart';
import 'package:tiledjsonreader/util/extensions.dart';

class ObjectGroup extends MapLayer {
  String drawOrder;
  List<Objects> objects;
  double opacity;

  ObjectGroup({
    this.drawOrder,
    this.objects,
    this.opacity,
  });

  ObjectGroup.fromJson(Map<String, dynamic> json) {
    drawOrder = json['draworder'];
    id = json['id'];
    name = json['name'];
    if (json['objects'] != null) {
      objects = new List<Objects>();
      json['objects'].forEach((v) {
        objects.add(new Objects.fromJson(v));
      });
    }
    opacity = double.parse(json['opacity'].toString());
    type = json['type'].toString().getTypeLayer();
    visible = json['visible'];
    x = double.tryParse(json['x'].toString()) ?? 0.0;
    y = double.tryParse(json['y'].toString()) ?? 0.0;
    offsetX = double.tryParse(json['offsetx'].toString()) ?? 0.0;
    offsetY = double.tryParse(json['offsety'].toString()) ?? 0.0;
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
    data['type'] = this.type.getName();
    data['visible'] = this.visible;
    data['x'] = this.x;
    data['y'] = this.y;
    return data;
  }
}
