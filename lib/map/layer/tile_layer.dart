import 'package:tiledjsonreader/map/layer/map_layer.dart';
import 'package:tiledjsonreader/util/extensions.dart';

class TileLayer extends MapLayer {
  List<int> data;
  double height;
  double offsetX;
  double offsetY;
  int opacity;
  double width;

  TileLayer({
    this.data,
    this.height,
    this.offsetX,
    this.offsetY,
    this.opacity,
    this.width,
  });

  TileLayer.fromJson(Map<String, dynamic> json) {
    data = json['data'].cast<int>();
    height = double.parse(json['height'].toString());
    id = json['id'];
    name = json['name'];
    offsetX = json['offsetx'];
    offsetY = json['offsety'];
    opacity = json['opacity'];
    type = json['type'].toString().getTypeLayer();
    visible = json['visible'];
    width = double.parse(json['width'].toString());
    x = double.parse(json['x'].toString());
    y = double.parse(json['y'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    data['height'] = this.height;
    data['id'] = this.id;
    data['name'] = this.name;
    data['offsetx'] = this.offsetX;
    data['offsety'] = this.offsetY;
    data['opacity'] = this.opacity;
    data['type'] = this.type.getName();
    data['visible'] = this.visible;
    data['width'] = this.width;
    data['x'] = this.x;
    data['y'] = this.y;
    return data;
  }
}
