import '../../map/layer/map_layer.dart';
import '../../util/extensions.dart';

class ImageLayer extends MapLayer {
  String image;
  double parallaxX;
  double parallaxY;

  ImageLayer({
    required this.image,
    this.parallaxX = 1,
    this.parallaxY = 1,
  });

  ImageLayer.fromJson(Map<String, dynamic> json)
      : image = json['image'],
        parallaxX = double.tryParse(json['parallaxx'].toString()) ?? 1,
        parallaxY = double.tryParse(json['parallaxy'].toString()) ?? 1 {
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type?.getName();
    data['visible'] = this.visible;
    data['x'] = this.x;
    data['y'] = this.y;
    data['offsetx'] = this.offsetX;
    data['offsety'] = this.offsetY;
    data['parallaxx'] = this.parallaxX;
    data['parallaxy'] = this.parallaxY;
    data['image'] = this.image;
    return data;
  }
}
