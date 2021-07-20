import '../../util/extensions.dart';
import 'image_layer.dart';
import 'map_layer.dart';
import 'object_group.dart';
import 'tile_layer.dart';
import 'type_layer.dart';

class GroupLayer extends MapLayer {
  List<MapLayer>? layers;

  GroupLayer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    offsetX = double.tryParse(json['offsetx'].toString()) ?? 0.0;
    offsetY = double.tryParse(json['offsety'].toString()) ?? 0.0;
    type = json['type'].toString().getTypeLayer();
    visible = json['visible'];
    opacity = double.tryParse(json['opacity'].toString()) ?? 0.0;
    x = double.tryParse(json['x'].toString()) ?? 0.0;
    y = double.tryParse(json['y'].toString()) ?? 0.0;

    if (json['layers'] != null) {
      layers = <MapLayer>[];
      json['layers'].forEach((v) {
        if (v['type'] == TypeLayer.tilelayer.getName()) {
          layers?.add(TileLayer.fromJson(v));
        } else if (v['type'] == TypeLayer.objectgroup.getName()) {
          layers?.add(ObjectGroup.fromJson(v));
        } else if (v['type'] == TypeLayer.imagelayer.getName()) {
          layers?.add(ImageLayer.fromJson(v));
        } else if (v['type'] == TypeLayer.group.getName()) {
          layers?.add(GroupLayer.fromJson(v));
        } else {
          layers?.add(MapLayer.fromJson(v));
        }
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.layers != null) {
      data['layers'] = this.layers?.map((v) => v.toJson()).toList();
    }
    data['opacity'] = this.opacity;
    data['type'] = this.type?.getName();
    data['visible'] = this.visible;
    data['x'] = this.x;
    data['y'] = this.y;
    return data;
  }
}
