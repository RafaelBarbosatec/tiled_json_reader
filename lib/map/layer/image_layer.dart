import '../../map/layer/map_layer.dart';
import '../../util/extensions.dart';

class ImageLayer extends MapLayer {
  String image;

  ImageLayer({
    required this.image,
  });

  ImageLayer.fromJson(Map<String, dynamic> json) : image = json['image'] {
    id = json['id'];
    name = json['name'];
    offsetX = double.tryParse(json['offsetx'].toString()) ?? 0.0;
    offsetY = double.tryParse(json['offsety'].toString()) ?? 0.0;
    type = json['type'].toString().getTypeLayer();
    visible = json['visible'];
    opacity = double.tryParse(json['opacity'].toString()) ?? 0.0;
    x = double.tryParse(json['x'].toString()) ?? 0.0;
    y = double.tryParse(json['y'].toString()) ?? 0.0;
  }
}
