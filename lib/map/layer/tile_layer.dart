import 'package:tiledjsonreader/map/layer/map_layer.dart';
import 'package:tiledjsonreader/util/extensions.dart';

class TileLayer extends MapLayer {
  List<int> data;
  double height;
  double opacity;
  double width;

  TileLayer({
    this.data,
    this.height,
    this.opacity,
    this.width,
  });

  TileLayer.fromJson(Map<String, dynamic> json) {
    data = json['data'].cast<int>();
    height = double.tryParse(json['height'].toString()) ?? 0.0;
    id = json['id'];
    name = json['name'];
    offsetX = double.tryParse(json['offsetx'].toString()) ?? 0.0;
    offsetY = double.tryParse(json['offsety'].toString()) ?? 0.0;
    opacity = double.tryParse(json['opacity'].toString()) ?? 0.0;
    type = json['type'].toString().getTypeLayer();
    visible = json['visible'];
    width = double.tryParse(json['width'].toString()) ?? 0.0;
    x = double.tryParse(json['x'].toString()) ?? 0.0;
    y = double.tryParse(json['y'].toString()) ?? 0.0;
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
