
import 'package:tiledjsonreader/map/layer/type_layer.dart';
import 'package:tiledjsonreader/util/extensions.dart';

class MapLayer {
  int id;
  String name;
  bool visible;
  double x;
  double y;
  TypeLayer type;

  MapLayer({this.id, this.name, this.type, this.visible, this.x, this.y});

  MapLayer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'].toString().getTypeLayer();
    visible = json['visible'];
    x = double.parse(json['x'].toString());
    y = double.parse(json['y'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type.getName();
    data['visible'] = this.visible;
    data['x'] = this.x;
    data['y'] = this.y;
    return data;
  }
}
